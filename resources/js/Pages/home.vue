<template>
  <v-app>
    <v-main>
    <div class="d-flex justify-center">
    <v-card elevation="2" width="400" height="350" class="mt-15">
       <div class="text-center mt-5 font-weight-black">
        <span > LOGIN </span>
       </div>
        <v-card-text>
            <v-form>
            <v-text-field variant="outlined" label="Username" v-model="form.username" :error-messages="errors.username"></v-text-field>
            <v-text-field
            label="Password"
            type="password"
            v-model="form.password"
            :error-messages="errors.password"
            variant="outlined"
            ></v-text-field>
            <v-btn block color="primary" @click="login">Login</v-btn>
        <div class="mt-5">
            <v-btn block elevation="2" small x-small @click="register">Register</v-btn>
        </div>
            </v-form>
        </v-card-text>
        </v-card>
        </div>
    </v-main>
  </v-app>
</template>

<script>
import {router} from '@inertiajs/vue3'
export default {
props:{
    errors:Object
},
    data(){
        return{
            form:{
                username:"",
                password:"",
            }
        }
    },
    methods:{
        login(){
            router.post('/login', this.form)
        },
        register(){
            router.get('/register')
        }
    },
};

</script>

