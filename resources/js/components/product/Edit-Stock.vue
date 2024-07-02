<template>

<div>

<div class="row">
    <router-link to="/stock" class="btn btn-primary">Go Back</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Stock Update</h1>
                  </div>
                  <form class="user" @submit.prevent="stockUpdate">

                
                    <div class="form-group">
                     
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1">Stock Product</label>
                            <input type="text" class="form-control" v-model="form.product_quantity" id="exampleInputFirstName"  placeholder="Enter product quantity">
                            
                            </div>
                       
                    </div>

                  

                    <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Update Stock</button>
                    </div>
                    <hr>

                    </form>
                  <hr>
                  
                  <div class="text-center">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>

</template>

<script type="text/javascript">
import axios from 'axios';

export default {

 

  data(){
    return{
        form: {
            product_quantity: '',
        },

        errors: [],
      
      
    }
  },

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    }
    console.log(this.form);

    let id = this.$route.params.id;
    axios.get('/api/product/'+id)
    .then(({data}) =>(this.form = data))
    .catch(console.log('error'))

  },

  methods:{


    stockUpdate(){
        let id = this.$route.params.id;
      axios.post("/api/stock/update/"+id,this.form)
      .then(() =>{

        this.$router.push({name: 'Stock'});

           Toast.fire({
            icon: "success",
            title: "successfully stock updated"
          });
      })

      .catch(error => this.errors = error.response.data.errors)

    },


  }


}

</script>