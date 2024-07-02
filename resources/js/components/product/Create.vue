<template>

<div>

<div class="row">
    <router-link to="/product" class="btn btn-primary">All Product</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Add Product</h1>
                  </div>
                  <form class="user" @submit.prevent="productInsert" enctype="multipart/form-data">

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1">Product Name</label>
                            <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter Product Name"
                             v-model="form.product_name">
                            
                            </div>
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1">Product Code</label>
                               <input type="text" class="form-control" v-model="form.product_code"   placeholder="Enter Product Code">
                               
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                           
                                <label for="exampleFormControlSelect1">Select Category</label>
                                <select v-model="form.category_id" class="form-control" id="exampleFormControlSelect1">
                                    <option :value="category.id" v-for="category in categories">{{category.category_name}}</option> 
                                </select>
                            </div>
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1">Product Supplier</label>
                                <select v-model="form.supplier_id" class="form-control" id="exampleFormControlSelect1">
                                <option :value="supplier.id" v-for="supplier in suppliers">{{supplier.name}}</option>
                                </select>  
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-4">
                            <label for="exampleFormControlSelect1">Product Root</label>
                            <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter Product root"
                             v-model="form.root">
                            </div>

                            <div class="col-md-4">
                            <label for="exampleFormControlSelect1">Buying Price</label>
                            <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter buying price"
                             v-model="form.buying_price">
                            </div>

                            <div class="col-md-4">
                            <label for="exampleFormControlSelect1">Selling Price</label>
                               <input type="text" class="form-control" v-model="form.selling_price"   placeholder="Enter selling price">
                               
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <label for="exampleFormControlSelect1">Buying Date</label>
                               <input type="date" class="form-control" v-model="form.buying_date" id="exampleInputFirstName"  placeholder="Enter buying  date">
                              
                            </div>
                            <div class="col-md-6">
                               <label for="exampleFormControlSelect1">Product Quantity</label>
                               <input type="text" class="form-control" v-model="form.product_quantity" id="exampleInputFirstName"  placeholder="Enter product quantity">
                             
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <input type="file" class="custom-file-input"   id="customFile" @change="onFileSelect">
                               <label for="customFile" class="custom-file-label">Choose File</label>
                            </div>

                            <div class="col-md-6">
                                <img :src="form.image" style="width:40px; height:40px;" alt="">
                            </div>
                           
                        </div>
                    </div>
                   

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Submit</button>
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
            product_name: null,
            product_code: null,
            category_id: null,
            supplier_id: null,
            root: null,
            buying_price: null,
            selling_price: null,
            buying_date: null,
            image: null,
            product_quantity: null,
        },

        errors: {},
        categories: {},
        suppliers: {}
      
    }
  },

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    }
  
    axios.get('/api/category')
    .then(({data}) => (this.categories = data))

    axios.get('/api/supplier')
    .then(({data}) => (this.suppliers = data))

  },

  methods:{
            onFileSelect(event)
            {
                let file = event.target.files[0];
                if(file.size > 1048770)
                {
                    
                    Toast.fire({
                    icon: "warning",
                    title: "image size size must be less than 1 MB"
                });
                }else{
                    let reader = new FileReader();
                    reader.onload = event =>{
                    this.form.image = event.target.result 
                    };
                    reader.readAsDataURL(file);

                }

            },

            productInsert(){
            axios.post("/api/product",this.form)
            .then(() =>{

                this.$router.push({name: 'Product'});

                Toast.fire({
                    icon: "success",
                    title: "successfully done PRODUCT insert"
                });
            })

            .catch(error => this.errors = error.response.data.errors)

            },

  },




 

}

</script>