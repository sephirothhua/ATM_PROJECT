<template>
  <div class="app-container">
    <div class="filter-container clearfix">
      <div class="option-container fl">
        <el-button size="small" class="filter-item green-btn" @click="handleCreate">添加</el-button>
        <el-button size="small" class="filter-item green-btn" @click="handleReset">重置密码</el-button>
      </div>
    </div>

    <el-table :data="list" border highlight-current-row style="width: 100%">
      <el-table-column align="center" label="id" property="id" width="60">
      </el-table-column>

      <el-table-column align="center" label="用户" property="username">
      </el-table-column>

      <el-table-column align="center" label="邮箱" property="email">
      </el-table-column>

      <el-table-column align="left" label="注册日期" property="date_joined" :formatter="dateFormat">
      </el-table-column>

      <el-table-column align="center" label="操作" width="120">
        <template slot-scope="scope">
          <el-button type="text" class="table-operation-icon" title="编辑" @click="handleEdit(scope.row)"><i class="iconfont">&#xe615;</i></el-button>
          <el-button type="text" class="table-operation-icon" title="删除" @click="handleDelete(scope.row.id)"><i class="iconfont">&#xe64d;</i></el-button>
        </template>
      </el-table-column>

    </el-table>

    <div class="pagination-container">
      <el-pagination
        @current-change="changePage"
        :page-sizes="[10]"
        :page-size="pageSize"
        background
        layout="total, sizes, prev, pager, next"
        :total="total">
      </el-pagination>
    </div>

    <el-dialog title="添加用户" width="600px" :model="false" :append-to-body="true" :visible.sync="dialogFormVisible" @close="resetEdit">
      <el-form :model="user" :rules="rules" ref="user" label-position="right" label-width="80px">
        <el-form-item label="用户名称" prop="username">
          <el-input size="small" v-model="user.username" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="邮箱" prop="email">
          <el-input size="small" v-model="user.email" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="密码" prop="password">
          <el-input type="password" size="small" v-model="user.password" class="input-width"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="用户配置" width="600px" :model="false" :append-to-body="true" :visible.sync="dialogEditFormVisible" @close="resetEdit">
      <el-form :model="user" :rules="rules" ref="edit" label-position="right" label-width="80px">
        <el-form-item label="用户名称" prop="username">
          <el-input size="small" v-model="user.username" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="邮箱" prop="email">
          <el-input size="small" v-model="user.email" class="input-width"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogEditFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="submitEditForm">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="重置密码" width="600px" :model="false" :append-to-body="true" :visible.sync="dialogResetFormVisible" @close="resetEdit">
      <el-form :model="form_data" ref="reset" label-position="right" label-width="80px">
        <el-form-item label="当前密码" :required="true" prop="current_password">
          <el-input type="password" size="small" v-model="form_data.current_password" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="新密码" :required="true" prop="new_password">
          <el-input type="password" size="small" v-model="form_data.new_password" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="确认密码" :required="true" prop="confirm_password">
          <el-input type="password" size="small" v-model="confirm_password" class="input-width"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogResetFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="submitResetForm">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
  import fecha from 'fecha'
  export default {
    data () {
      const validatePass = (rule, value, callback) => {
        if (value.length < 6) {
          callback(new Error('密码不能小于6位'))
        } else {
          callback()
        }
      }
      return {
        list: [],
        total: 0,
        pageSize: 10,
        current_page: 1,
        user: {
          username: '',
          email: '',
          password: '',
          is_superuser: 1,
          is_staff: 1,
          is_active: 1
        },
        form_data: {},
        confirm_password: '',
        rules: {
          username: [
            { required: true, message: '请输入用户名' }
          ],
          email: [
            { required: true, message: '请输入邮箱' }
          ],
          password: [
            { required: true, validator: validatePass  }
          ]
        },
        dialogFormVisible: false,
        dialogEditFormVisible: false,
        dialogResetFormVisible: false,
        editId: ''
      }
    },
    mounted () {
      this.getList()
    },
    methods: {
      getList (val = 1) {
        const payload = {'page': val}
        this.$backend.$getUserList(payload).then((responseData) => {
          this.list = responseData.results
          this.total = responseData.count
        }).catch(error => {
          this.$toast('获取列表错误', 2000)
        })
      },
      handleDelete (id) {
        this.$backend.$deleteUser(id).then((responseData) => {
          this.$toast('删除成功')
          this.getList(this.current_page)
        }).catch(error => {
          if (error.response.request.responseText) {
            error.message = error.response.request.responseText
          } else {
            error.message = '删除错误'
          }
          this.$toast(error.message, 2000)
        })
      },
      handleCreate () {
        this.resetResetTemp()
        this.dialogFormVisible = true
        if (this.$refs.user !== undefined) {
          this.$refs.user.resetFields()
        }
      },
      resetTemp () {
        this.user = {
          username: '',
          email: '',
          password: '',
          is_superuser: 1,
          is_staff: 1,
          is_active: 1
        }
      },
      resetResetTemp () {
        this.form_data = {}
      },
      submitForm () {
        this.$refs.user.validate((valid) => {
          if (valid) {
            this.create()
          } else {
            console.log('error submit!!')
            return false
          }
        })
      },
      submitEditForm () {
        this.$refs.edit.validate((valid) => {
          if (valid) {
            this.create()
          } else {
            console.log('error submit!!')
            return false
          }
        })
      },
      submitResetForm () {
        if(this.confirm_password != this.form_data.new_password){
          this.$toast('两次密码不一致', 2000)
          return
        }
        this.$backend.$changePassword(this.form_data).then((responseData) => {
          this.dialogResetFormVisible = false
          this.$toast('重置成功')
          this.$store.commit("logout");
          this.$router.push("login");
        }).catch(error => {
          if (error.response.request.responseText) {
            error.message = error.response.request.responseText
          } else {
            error.message = '重置失败'
          }
          this.$toast(error.message, 2000)
        })
      },
      create () {
        if (this.editId) {
          delete  this.user.password
          this.$backend.$editUser(this.editId, this.user).then((responseData) => {
            this.dialogFormVisible = false
            this.$toast('修改成功')
          }).catch(error => {
            if (error.response.request.responseText) {
              error.message = error.response.request.responseText
            } else {
              error.message = '修改失败'
            }
            this.$toast(error.message, 2000)
          })
        } else {
          this.$backend.$createUser(this.user).then((responseData) => {
            this.dialogFormVisible = false
            this.$toast('添加成功')
            this.getList(this.current_page)
          }).catch(error => {
            if (error.response.request.responseText) {
              error.message = error.response.request.responseText
            } else {
              error.message = '添加错误'
            }
            this.$toast(error.message, 2000)
          })
        }
      },
      resetEdit () {
        this.editId = ''
      },
      handleEdit (row) {
        this.editId = row.id
        for (let key in this.user) {
          this.user[key] = row[key]
        }
        this.dialogEditFormVisible = true
      },
      handleReset () {
        this.resetTemp()
        this.dialogResetFormVisible = true
      },
      changePage (val) {
        this.getList(val)
      },
      dateFormat (row, column, cellValue) {
        return cellValue ? fecha.format(new Date(cellValue), 'YYYY-MM-DD HH:mm:ss') : ''
      }
    }
  }
</script>

<style lang="less">
  .app-container {
    padding: 10px;
    .filter-container {
      padding-bottom: 10px;
      .filter-item {
        display: inline-block;
        vertical-align: middle;
        margin: 10px 10px 10px 0;
      }
    }
    .pagination-container {
      float: right;
    }
    .table-operation-icon {
      margin-right: 5px;
      cursor: pointer;
      &:hover {
        color: #11a085;
      }
      &.el-button--text {
        color: #5a5e66;
      }
    }
  }
</style>
