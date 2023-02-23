<template>
  <v-table class="mx-10 my-10">
      <thead class="bg-blue">
        <tr>
            <th>#</th>
            <th>Nama</th>
            <th>NIK</th>
            <th>username</th>
            <th>No Handphone</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="(row,i) in reg" :key="i++">
            <td>{{i}}</td>
            <td>{{row.nama}}</td>
            <td>{{row.nik}}</td>
            <td>{{row.username}}</td>
            <td>{{row.tlp}}</td>
            <td>
               <v-btn color="primary" @click="konfirmasi(row.id)">Konfirmasi</v-btn>
            </td>
        </tr>

    </tbody>
</v-table>
</template>

<script>
import layout from '../../layout/layout.vue'
import {router} from '@inertiajs/vue3'
export default {
    props:{
        reg:Array
    },
layout:layout,
methods:{
    konfirmasi($id){
        router.visit('/admin/register/'+$id,{
            method:'get',
            preserveState: true,
            preserveScroll: true,
        })
    }
}
}
</script>

<style>

</style>
