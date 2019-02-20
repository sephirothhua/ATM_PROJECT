<template>
  <div class="app-container">
    <div class="filter-container clearfix">
      <div class="option-container fl">
        <el-button size="small" class="filter-item green-btn" @click="handleCreate">添加</el-button>
        <!--<el-button size="small" class="filter-item green-btn" @click="handleDeleteMore">删除</el-button>-->
      </div>
    </div>

    <el-table :data="list" border highlight-current-row style="width: 100%">
      <el-table-column align="center" label="id" property="id" width="60">
      </el-table-column>

      <el-table-column align="center" label="设备名称" property="name">
      </el-table-column>

      <el-table-column align="center" label="位置" property="position">
      </el-table-column>

      <el-table-column align="center" label="经度" property="longitude">
      </el-table-column>

      <el-table-column align="center" label="纬度" property="latitude">
      </el-table-column>

      <el-table-column align="center" label="rstp" property="rstp">
      </el-table-column>

      <el-table-column align="center" label="状态" property="status">
        <template slot-scope="scope">
          <span v-if="scope.row.status==1" style="color:red;">异常</span>
          <span v-if="scope.row.status==0" style="color:green;">正常</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="报警状态" property="is_alert">
        <template slot-scope="scope">
          <span v-if="scope.row.is_alert==1" style="color:red;">异常</span>
          <span v-if="scope.row.is_alert==0" style="color:green;">正常</span>
        </template>
      </el-table-column>

      <el-table-column align="left" label="创建日期" property="created_date" :formatter="dateFormat">
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

    <el-dialog title="设备配置" width="600px" :model="false" :append-to-body="true" :visible.sync="dialogFormVisible" @close="resetEdit">
      <el-form :model="device" :rules="rules" ref="device" label-position="right" label-width="80px">
        <el-form-item label="设备名称" prop="name">
          <el-input size="small" v-model="device.name" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="位置" prop="position">
          <el-input size="small" v-model="device.position" class="input-width"></el-input>
        </el-form-item>

        <el-form-item label="经度" prop="longitude">
          <el-input size="small" v-model="device.longitude" class="input-width">
          </el-input>
        </el-form-item>

        <el-form-item label="纬度" prop="latitude">
          <el-input size="small" v-model="device.latitude" class="input-width">
          </el-input>
        </el-form-item>

        <el-form-item label="rstp" prop="rstp">
          <el-input size="small" v-model="device.rstp" class="input-width">
          </el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import fecha from 'fecha'
  export default {
    data () {
      return {
        list: [],
        total: 0,
        pageSize: 10,
        current_page: 1,
        device: {
          name: '',
          position: '',
          longitude: '',
          latitude: '',
          rstp: '',
          is_alert:''
        },
        rules: {
          name: [
            { required: true, message: '请输入设备名称' }
          ],
          position: [
            { required: true, message: '请输入位置' }
          ],
          longitude: [
            { required: true, message: '请输入经度' }
          ],
          latitude: [
            { required: true, message: '请输入纬度' }
          ],
          rstp: [
            { required: true, message: '请输入rstp' }
          ]
        },
        dialogFormVisible: false,
        removeList: [],
        editId: ''
      }
    },
    mounted () {
      this.getList()
    },
    methods: {
      getList (val = 1) {
        const payload = {'page': val};
        this.$backend.$getDeviceList(payload).then((responseData) => {
          this.list = responseData.results;
          this.total = responseData.count
        }).catch(error => {
          this.$toast('获取列表错误', 2000)
        })
      },
      handleDelete (id) {
        this.$backend.$deleteDevice(id).then((responseData) => {
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
        this.resetTemp();
        this.dialogFormVisible = true;
        if (this.$refs.device !== undefined) {
          this.$refs.device.resetFields()
        }
      },
      resetTemp () {
        this.device = {
          name: '',
          position: '',
          longitude: '',
          latitude: '',
          rstp: ''
        }
      },
      submitForm () {
        this.$refs.device.validate((valid) => {
          if (valid) {
            this.create()
          } else {
            console.log('error submit!!')
            return false
          }
        })
      },
      create () {
        if (this.editId) {
          this.$backend.$editDevice(this.editId, this.device).then((responseData) => {
            this.dialogFormVisible = false
            this.$toast('修改成功')
            this.getList(this.current_page)
          }).catch(error => {
            if (error.response.request.responseText) {
              error.message = error.response.request.responseText
            } else {
              error.message = '修改失败'
            }
            this.$toast(error.message, 2000)
          })
        } else {
          this.$backend.$createDevice(this.device).then((responseData) => {
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
        for (let key in this.device) {
          this.device[key] = row[key]
        }
        this.dialogFormVisible = true
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
