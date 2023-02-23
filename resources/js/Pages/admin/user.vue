<template>
    <div class="mx-10 my-10 text-right">
        <v-btn prepend-icon="mdi mdi-plus" @click="dialog_insert = true" color="primary">
            tambah
        </v-btn>
    </div>
    <v-table class="mx-10 my-10">
        <thead class="bg-blue">
            <tr>
                <th>#</th>
                <th>Nama</th>
                <th>NIK</th>
                <th>username</th>
                <th>No Handphone</th>
                <th>Level</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(row, i) in data" :key="i++">
                <td>{{ i }}</td>
                <td>{{ row.nama }}</td>
                <td>{{ row.nik }}</td>
                <td>{{ row.username }}</td>
                <td>{{ row.tlp }}</td>
                <td>{{ row.level }}</td>
                <td>
                    <v-btn size="small" icon="mdi-pencil" color="green" class="mr-3" @click="edit(row.id)">
                    </v-btn>
                    <v-btn size="small" icon="mdi mdi-delete-forever" color="red" @click="konfirmasi(row.id)">
                    </v-btn>
                </td>
            </tr>

        </tbody>
    </v-table>
    <v-dialog v-model="dialog_insert" width="600">
        <v-card>
            <v-card-text>
                <v-form>
                    <v-text-field v-model="form.nama" label="Nama Lengkap" :error-messages="errors.nama" id="outlined">
                    </v-text-field>
                    <v-text-field v-model="form.nik" label="NIK" id="outlined">
                    </v-text-field>
                    <v-text-field v-model="form.username" label="Username" :error-messages="errors.username" id="outlined">
                    </v-text-field>
                    <v-text-field v-model="form.password" label="Password" :error-messages="errors.password" id="outlined">
                    </v-text-field>
                    <v-text-field v-model="form.tlp" label="No. Handphone" :error-messages="errors.tlp" id="outlined">
                    </v-text-field>
                    <v-select label="Level" :items="['Admin', 'Petugas', 'Masyarakat']" :error-messages="errors.level"
                        variant="solo" v-model="form.level">
                    </v-select>
                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-spacer />
                <v-btn color="primary" @click="batal">Batal</v-btn>
                <v-btn color="primary" @click="simpan">Simpan</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
    <v-dialog v-model="dialog_hapus" width="400">
        <v-card>
            <v-card-text>Apakah anda ingin menghapus?</v-card-text>
            <v-card-actions>
                <v-btn color="primary" @click="batal">Tidak</v-btn>
                <v-btn color="red" @click="hapus">Ya</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>
import layout from '../../layout/layout.vue';
import { router } from '@inertiajs/vue3'
export default {
    layout: layout,
    props: {
        data: Array,
        errors: Object
    },
    data() {
        return {
            dialog_insert: false,
            dialog_hapus: false,
            form: {
                id: "",
                nama: "",
                username: "",
                password: "",
                level: "",
                tlp: "",
            }
        }
    },
    methods: {
        simpan() {
            router.visit('/admin/user', {
                method: 'post',
                data: {
                    id: this.form.id,
                    nama: this.form.nama,
                    nik: this.form.nik,
                    username: this.form.username,
                    password: this.form.password,
                    level: this.form.level,
                    tlp: this.form.tlp,
                },
                preserveState: true,
                preserveScroll: true,
                onSuccess: () => {
                    this.batal()
                }

            })
        },
        batal() {
            this.form.id = ""
            this.form.nama = ""
            this.form.nik = ""
            this.form.username = ""
            this.form.password = ""
            this.form.level = ""
            this.form.tlp = ""
            this.dialog_insert = false
            this.dialog_hapus = false
        },
        konfirmasi($id) {
            this.form.id = $id
            this.dialog_hapus = true
        },
        edit($id) {
            fetch('/admin/user/' + $id)
                .then(res => res.json())
                .then(data => {
                    this.form.id = data.id
                    this.form.nama = data.nama
                    this.form.nik = data.nik
                    this.form.username = data.username
                    this.form.level = data.level
                    this.form.tlp = data.tlp
                    this.dialog_insert = true
                })
        },
        hapus() {
            router.visit('/admin/user/' + this.form.id, {
                method: 'delete',
                preserveState: true,
                preserveScroll: true,
                onSuccess: () => {
                    this.batal()
                },
            })
        }
    }
}
</script>

<style></style>
