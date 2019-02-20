<template>
  <div class="app-container">
    <div class="search-input-suffix">
      <el-date-picker v-model="search_date" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"></el-date-picker>
      <el-input placeholder="请输入设备名称"  v-model="search_context"></el-input>
      <el-input placeholder="请输入设备id"  v-model="search_id"></el-input>
      <el-button id="submit" @click="search" slot="append" icon="el-icon-search" ></el-button>
    </div>

    <el-table :data="list" border highlight-current-row style="width: 100%">
      <el-table-column align="center" label="id" property="id" width="60">
      </el-table-column>

      <el-table-column align="center" label="设备名称" property="camera_name">
      </el-table-column>

      <el-table-column align="center" label="图片路径" property="image_path">
      </el-table-column>

      <el-table-column align="center" label="图片" property="image_path">
        <template slot-scope="scope">
          <img  :src="scope.row.image_path" alt="" style="width: 100px;height: 50px">
        </template>
      </el-table-column>

      <el-table-column align="center" label="状态" property="status_name">
        <template slot-scope="scope">
          <span v-if="scope.row.status_name=='异常'" style="color:red;">异常</span>
          <span v-if="scope.row.status_name=='正常'" style="color:green;">正常</span>
        </template>
      </el-table-column>

      <el-table-column align="left" label="创建日期" property="created_date" :formatter="dateFormat">
      </el-table-column>

      <el-table-column align="center" label="操作" width="120">
        <template slot-scope="scope">
          <el-button type="text" class="table-operation-icon" title="查看" @click="handleEdit(scope.row)"><i class="iconfont">&#xe615;</i></el-button>
          <el-button type="text" class="table-operation-icon" title="删除" @click="handleDelete(scope.row.id)"><i class="iconfont">&#xe64d;</i></el-button>
        </template>
      </el-table-column>

    </el-table>

    <div class="pagination-container">
      <el-pagination
        @current-change="changePage"
        :page-sizes="[8]"
        :page-size="pageSize"
        background
        layout="total, sizes, prev, pager, next"
        :total="total">
      </el-pagination>
    </div>

    <el-dialog title="日志详情" width="900px" :model="false" :append-to-body="true" :visible.sync="dialogFormVisible" @close="resetEdit">
      <el-form :model="log" ref="log" label-position="right" label-width="80px">
        <el-form-item label="设备名称" prop="camera_name">
          <el-input size="small" v-model="log.camera_name" class="input-width" readonly></el-input>
        </el-form-item>

        <el-form-item label="图片" prop="image_path">
          <template v-model="log.image_path">
            <img  :src="log.image_path" alt="" style="width: 750px;height: 400px">
          </template>
        </el-form-item>

        <el-form-item label="状态" prop="latitude">
          <el-input size="small" v-model="log.status_name" class="input-width" readonly>
          </el-input>
        </el-form-item>

        <el-form-item label="创建日期" prop="created_date">
          <el-input size="small" v-model="log.created_date" class="input-width" :formatter="dateFormat" readonly>
          </el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogFormVisible = false">关 闭</el-button>
        <!--<el-button size="small" type="primary" @click="submitForm">确 定</el-button>-->
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import fecha from 'fecha'
  export default {
    data () {
      return {
        search_date: '',
        search_context: '',
        search_id: '',
        list: [],
        total: 0,
        pageSize: 8,
        current_page: 1,
        log: {
          camera_name: '',
          image_path: '',
          status_name: '',
          created_date: ''
        },
        dialogFormVisible: false,
        editId: ''
      }
    },
    mounted () {
      this.getList()
    },
    methods: {
      getList (val = 1) {
        const payload = {'name':this.search_context,'id':this.search_id, 'date': this.search_date,'page': val}
        this.$backend.$getLogList(payload).then((responseData) => {
          this.list = responseData.results;
          this.total = responseData.count
        }).catch(error => {
          this.$toast('获取列表错误', 2000)
        })
      },
      handleDelete (id) {
        this.$backend.$deleteLog(id).then((responseData) => {
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
      resetEdit () {
        this.editId = ''
      },
      handleEdit (row) {
        this.editId = row.id
        for (let key in this.log) {
          if (key === 'created_date') {
            this.log[key] = fecha.format(new Date(row[key]), 'YYYY-MM-DD HH:mm:ss')
          } else {
            this.log[key] = row[key]
          }
        }
        this.dialogFormVisible = true
      },
      changePage (val) {
        this.getList(val)
      },
      dateFormat (row, column, cellValue) {
        return cellValue ? fecha.format(new Date(cellValue), 'YYYY-MM-DD HH:mm:ss') : ''
      },
      search (){
        this.getList()
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
    .search-input-suffix .el-input {
      width: 180px;
      margin-bottom: 10px;
    }
  }
</style>
