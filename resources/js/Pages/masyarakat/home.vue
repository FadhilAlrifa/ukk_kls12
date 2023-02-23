<template>
    <!-- <h1>ini halaman masyarakat</h1> -->
    <div class="d-flex justify-center">
        <v-card class="my-8" width="800" v-if="datas.length">
            <v-card-text>
                <v-list lines="three">

                    <v-list-item v-for="row in datas" :key="row.id">
                        <v-list-title>{{ row.nama }} - {{ row.nik }}</v-list-title>
                        <v-list-item-title>{{ row.tgl_pengaduan }}</v-list-item-title>
                        <v-list-item-subtitle>
                            <p v-html="row.isi"></p>
                        </v-list-item-subtitle>

                        <v-list-item-subtitle>
                            <span v-if="row.status == '0'" class="text-red">Status: Belum Diproses </span>
                            <span v-else class="text-red">Status: {{ row.status }} </span>
                        </v-list-item-subtitle>

                        <v-list-item-subtitle>
                            <v-btn class="mt-3" color="blue" @click="tampilkan">Tanggapan</v-btn>
                            <v-sheet v-show="tampil" class="mx-auto" height="100" width="100">aswrwb</v-sheet>
                        </v-list-item-subtitle>
                        <v-divider class="mt-3" />

                        <template v-slot:prepend>
                            <v-avatar color="grey-lighten-1">
                                <v-img class="bg-white" width="300" :aspect-ratio="1" :src="'/storage/' + row.foto"
                                    cover></v-img>
                            </v-avatar>
                        </template>

                        <template v-slot:append>
                        </template>
                    </v-list-item>
                </v-list>
            </v-card-text>
        </v-card>
    </div>
</template>

<script>
import layout2Vue from '../../layout/layout2.vue'
export default {
    layout: layout2Vue,
    props: {
        datas: Array
    },
}
</script>

<style></style>
