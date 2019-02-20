<template>
  <div id="map" ref="allmap"></div>
</template>

<script>
import BMap from 'BMap'
import Vue from 'vue'


export default {
  name: 'home',
  data () {
    return {
      position:'',
      status:'',
      is_alert:'',
      rstp:''
    }
  },
  mounted () {
    this.initMap()
  },
  methods: {
    initMap () {
        this.$backend.$getAllDevice().then((responseData) => {
          let list = responseData.results;
          let map = new BMap.Map(this.$refs.allmap); // 创建Map实例
          let component = new myComponent().$mount();
          // Vue.component('myCom',myComponent);
          // 添加地图类型控件
          map.addControl(new BMap.NavigationControl());
          map.addControl(new BMap.ScaleControl());
          map.addControl(new BMap.OverviewMapControl());
          map.addControl(new BMap.MapTypeControl());
          map.setCurrentCity('哈尔滨'); // 设置地图显示的城市 此项是必须设置的
          map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
          // 添加点坐标
          for (let item of list) {
            // this.position = item.position;
            // this.status = item.status;
            // this.is_alert = item.is_alert;
            // this.rstp = item.rstp;
            let point = new BMap.Point(item.longitude, item.latitude);
            let marker = new BMap.Marker(point); // 创建标注
            map.addOverlay(marker);             // 将标注添加到地图中
            map.centerAndZoom(point, 10);
            let opts = {
              width: 80,     // 信息窗口宽度
              height: 150,     // 信息窗口高度
              title: item.name, // 信息窗口标题
              enableMessage: false // 设置允许信息窗发送短息
            };

            var content = '<div class="alarmDiv" id="fm" align="left" rstp='+item.rstp+' camid='+item.id+'>'
            content+='<table style="width:100%;height:100%;" frame="none" cellpadding="0" cellspacing="0">';
            content+='<tr><th class="tabLabel">地区:</th>';
            content+='<td class="tabText">' + item.position +'</td></tr>';
            content+='<tr><th class="tabLabel">状态:</th>';
            if(item.status ==1 ){
              content += '<td class="tabText">' + '<span style="color:red;">异常</span></tr>'
            }else{
              content += '<td class="tabText">' + '<span style="color:green;">正常</span></tr>'
            }
            content+='<tr><th class="tabLabel">报警状态:</th>';
            if(item.is_alert ==1 ){
              content += '<td class="tabText">' + '<span style="color:red;">异常</span></tr>'
            }else{
              content += '<td class="tabText">' + '<span style="color:green;">正常</span></tr></table>'
            }
            content+='</div>';

            // var content = '<div id="fm" align="left" rstp='+this.rstp+' position='+this.position+' is_alert='+this.is_alert+'></div>';
            let infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
            marker.addEventListener('click', function () {
              map.openInfoWindow(infoWindow, point) // 开启信息窗口
              $(function () {
                $("#fm").append(component.$el)
                // $("#fm").append('<my-com></my-com>')
              })
            })
          }
        }).catch(error => {
          console.log(error);
          this.$toast('获取失败', 2000)
        })
      },
  },
}

var myComponent = Vue.extend(
  {
    // props: ['position','status','is_alert','rstp'],
    data () {
      return {
        position :"",
        rstp:"rtsp://admin:Grandhonor12306@192.167.2.222:554",
        is_alert :0
      }
    },
    template: '<button type="button" class="btn btn-secondary" id="view_button" v-on:click="onclick" style="margin-left: 95px;margin-top: 10px">预览</button>',
    mounted:function(){

    },
    methods:{
      onclick:function() {
        // alert(this.position);
        window.open("http://127.0.0.1:8000/view?url=" + $("#fm").attr("rstp") +"?id=" +$("#fm").attr("camid"),'_blank','scrollbars=0,resizable=0,width=1200,height=670,top=100,left=100')
      }

    }
  }
)
</script>
 
<style>
  #map {
    height: 100%;
    width: 100%;
  }
</style>
