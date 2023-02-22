<template>
    <h1 @mouseover="sentuh" @mouseleave="sentuh">ini {{coba}}</h1>
  <span v-show="show"> {{ tampil }} </span>
</template>

<script>
export default {
    props: {
        datas:String
    },
    data(){
        return {
            coba:"saya dari data",
            tampil:"anda menyentuh saya",
            show:false
        }
    },

    methods:{
        sentuh(){
            this.show=!this.show
        }
    },
    created(){

    }
}
</script>
