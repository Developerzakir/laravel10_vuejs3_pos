<template>

<div>

<div class="row">
    <router-link to="/store-product" class="btn btn-primary">Add Product</router-link>
</div><br>
<input type="text" class="form-control" v-model="searchTerm" style="width:300px;" placeholder="Search Here..">

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
          <div class="row">
            <div class="col-lg-12 mb-4">
              <!-- Simple Tables -->
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Employee Lists</h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Image</th>
                        <th>Category Name</th>
                        <th>Supplier Name</th>
                        <th>Buying Price</th>
                        <th>Selling Price</th>
                        <th>Root</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="product in filterSearch" :key="product.id">
                        <td><a href="#">{{product.product_name}}</a></td>

                        <td><a href="#">{{product.product_code}}</a></td>

                        <td><a href="#">
                          <img :src="product.image" id="em_photo" alt="">
                        </a></td>

                       
                        <td>{{product.category_name}}</td>
                        <td>{{product.name}}</td>
                        <td>{{product.buying_price}}</td>
                        <td>{{product.selling_price}}</td>
                        <td>{{product.root}}</td>
                       
                        <td>
                          <router-link :to="{name: 'editProduct', params:{id:product.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="productDelete(product.id)" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
                <div class="card-footer"></div>
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

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    };

    this.allProducts();

  },

  data(){
    return{
      products: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.products.filter(product =>{
        return product.product_name.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allProducts(){
      axios.get('/api/product')
      .then(({data}) => (this.products = data))
      .catch()
    },

    productDelete(id){
          Swal.fire({
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!"
        }).then((result) => {
          if (result.isConfirmed) {
            axios.delete('/api/product/'+id)
            .then(()=>{
              this.products = this.products.filter(product =>{
                return product.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Product'})
            })

            Swal.fire({
              title: "Deleted!",
              text: "Your file has been deleted.",
              icon: "success"
            });
          }
        });
    }
   
  }


 

}

</script>

<style type="text/css">
  #em_photo{
    width:80px;
    height:80px;
  }

</style>