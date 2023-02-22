<template>
    <div class="d-flex justify-center">
        <v-card width="60%">
            <v-card-text>
                <v-form>
                    <v-file-input prepend-icon="mdi-camera" label="Masukkan File" variant="outlined" @input="form.foto = $event.target.files[0]"></v-file-input>
                </v-form>
                <div class="my-3 font-weight-medium">Masukkan Pengaduan anda :</div>
                <QuillEditor v-model:content="form.isi" contentType="html" />
            </v-card-text>
            <v-card-action>
                <v-btn color="blue" class="ml-4 mb-3" @click="adukan">Adukan</v-btn>
            </v-card-action>
        </v-card>
    </div>
    <div class="d-flex justify-center">
        <v-card class=" my-5 " width="60%" v-if='datas.length'>
            <v-card-text>
                <v-list lines="three">
                    <v-list-item v-for="row in datas" :key="row.id">
                        <v-list-item-title>{{ row.tgl_pengaduan }}</v-list-item-title>

                        <v-list-item-subtitle>
                            <p v-html="row.isi"></p>
                        </v-list-item-subtitle>

                        <v-list-item>
                            <span v-if="row.status=='0'" class="text-red">Status : belum diproses</span>
                            <span v-else class="text-red">Status : {{row.status}}</span>
                        </v-list-item>
                        <v-list-item-subtitle>
                            <tanggapan-1 :id="row.id"/>
                        </v-list-item-subtitle>
                        <template v-slot:prepend>
                        <v-avatar color="grey-lighten-1" size="50">
                            <v-img
                            class="bg-white"
                            width="300"
                            :aspect-ratio="1"
                            :src="'/storage/'+row.foto"
                            cover
                        ></v-img>
                        </v-avatar>
                        </template>
                        <template v-slot:append>

                            <v-menu>
                            <template v-slot:activator="{ props }">
                            <v-btn
                                color="grey-lighten-1"
                                icon="mdi-information"
                                variant="text"
                                v-bind="props"
                            >
                            </v-btn>
                            </template>
                            <v-list>
                                <v-list-item @click="hapus(row.id)">hapus</v-list-item>
                            </v-list>
                            </v-menu>
                        </template>
      </v-list-item>
            </v-list>
        </v-card-text>
    </v-card>
    </div>
</template>

<script>
import { router, useForm } from '@inertiajs/vue3'
import tanggapan1 from '../components/tanggapan1.vue'
import layout2 from '../../layout/layout2.vue'
export default {
    layout: layout2,
    components:{
        tanggapan1
    },
    props: {
        datas: Array,
    },
    data() {
        return {
            form: useForm({
                foto: null,
                isi: "",
            })
        }
    },
    methods: {
        adukan() {
            router.post('/masyarakat/pengaduan', this.form, {
                method: 'post',
                preserveState: false,
                preserveScroll: false,
                forceFormData: true,
                onSuccess: () => {
                    this.batal();
                }

            })
            // this.batal();
        },
        batal() {
            this.form.foto = null,
                this.form.isi = ""
            // router.visit('/admin/user/'+this.form,{
            //     method:'post',
            //     preserveState: true,
            //     preserveScroll: false,
        },
        hapus($id){
            router.visit('/masyarakat/pengaduan/'+$id,{
                method:'delete',
                preserveState:false,
                preserveScroll:false,
            })
        },

    },
}
</script>

<style>

</style>
