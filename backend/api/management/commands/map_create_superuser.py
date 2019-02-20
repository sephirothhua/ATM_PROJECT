
from django.core.management.base import BaseCommand
from django.db.utils import IntegrityError

from backend.api.models import User


class Command(BaseCommand):
    help = '创建超级用户'

    def handle(self, *args, **options):
        user = User()
        user.username = input("用户名:")
        user.email = input("邮箱:")
        user.set_password(input("密码:"))
        user.is_active = True
        user.is_superuser = True
        user.is_staff = True

        try:
            user.save()
        except IntegrityError:
            print("{} 已存在".format(user.username))
            return
        print("创建成功")
