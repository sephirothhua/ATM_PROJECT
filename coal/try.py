import cv2
from detection.gh_rfcn_python import rfcn_show_pic_cv
import avro.schema
import time
# 视频流读取图片
def read_pic(rstp, video_name, video_number):
    try:
        cap = cv2.VideoCapture(rstp)
        ret, frame = cap.read()
        i = 0

        # if ret:
        #     # 记录正常状态
        #     # Camera.objects.filter(id=video_number).update(status=1)
        #     print('ok')
        while ret:
            i += 1
            count, img = rfcn_show_pic_cv.processing(frame, str(time.time()) + '.jpg')
            print(count)
            ret, frame = cap.read()
            cv2.imshow('12',img)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
            #
            # # 十帧抓取
            # if i % 10 == 0:
            #     # logger.info('video_name:' + video_name + ', i_frame:' + i)
            #     print('video_name:' + video_name)
                # 转换为bytes
                # success, encoded_image = cv2.imencode('.jpg', frame)
                # content = encoded_image.tobytes()
                # 推入kafka
                # put_frame(video_name, video_number, content)
        # else:
        #     # 读取视频流出错 记录异常
        #     print('wrong')
    except Exception as e:
        # 读取视频流出错 记录异常
        print(str(e))

rfcn_show_pic_cv.process_start()

read_pic("rtsp://admin:Grandhonor12306@192.167.2.222:554", 'test2', 2)
