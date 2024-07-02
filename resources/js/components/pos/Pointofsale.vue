<template>

<div>
<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </div>

          <div class="row mb-3">
           

            <!-- Area Chart -->
            <div class="col-xl-5 col-lg-5">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Expense Insert</h6>
                  <a href="" class="btn btn-sm btn-info">Add Customer</a> 
                </div>

                <div class="table-responsive" style="font-size:13px;">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Name</th>
                        <th>Qty</th>
                        <th>Unit</th>
                        <th>Total</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>

                      <tr v-for="cart in carts" :key="cart.id">
                        <td><a href="#">{{cart.pro_name}}</a></td>
                        <td>
                          <input type="text" readonly="" style="width:20px;" :value="cart.pro_quantity">
                          <button @click.prevent="increment(cart.id)" class="btn btn-sm btn-success">+</button>

                          <button @click.prevent="decrement(cart.id)" v-if="cart.pro_quantity >=2" class="btn btn-sm btn-danger">-</button>
                          <button v-else class="btn btn-sm btn-danger" disabled>-</button>
                        </td>
                        <td>{{cart.product_price}}</td>
                        <td>{{cart.sub_total}}</td>
                        <td><a  @click="removeItem(cart.id)" class="btn btn-sm btn-primary text-light">X</a></td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
                <div class="card-footer">
                  <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Total Quantity: <strong>{{qty}}</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Sub Total: <strong>{{subtotal}} $</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Vat: <strong>{{vats.vat}} %</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Total: <strong>{{subtotal*vats.vat / 100 + subtotal}} $</strong>
                    </li>
                  </ul>
                  <br> 
                  <form action="">
                    <label for="">Customer Name</label>
                    <select class="form-control"  v-model="customer_id">
                        <option v-for="customer in customers" :key="customer.id">{{customer.name}}</option>
                       
                    </select>

                    <label for="">Pay</label>
                    <input type="text" class="form-control" v-model="pay">

                    <label for="">Due</label>
                    <input type="text" class="form-control" v-model="due">


                    <label for="">Pay By</label>
                    <select class="form-control"  v-model="customer_id">
                        <option value="HandCash">Hand Cash</option>
                        <option value="Cheaque">Cheaque</option>
                        <option value="GiftCard">Gift Card</option>
                    </select>

                    <br>

                    <button type="submit" class="btn btn-success">Submit</button>

                  </form>
                </div>
                
              </div>
            </div>
            <!-- Pie Chart -->
            <div class="col-xl-7 col-lg-7">
              <div class="card mb-4">
                 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Products Sold</h6>
                </div>

                  <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">All Products</button>
                    </li>

                    <li class="nav-item" role="presentation" v-for="category in categories" :key="category.id">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" @click="subProduct(category.id)">{{category.category_name}}</button>
                    </li>
                 
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="card-body">
                <input type="text" class="form-control" v-model="searchTerm" style="width:600px; margin-bottom:10px;" placeholder="Search Here..">
                <div class="row">
                   <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="product in filterSearch" :key="product.id">
                        
                            <button class="btn btn-sm" @click.prevent="addToCart(product.id)">
                            <div class="card" style="width: 8.5rem; margin-bottom:5px;">
                            <img :src="product.image" id="em_photo" class="card-img-top">
                                <div class="card-body">
                                    <h6 class="card-title">{{product.product_name}}</h6>
                                    <span class="badge badge-success" v-if="product.product_quantity >=1 ">Available {{product.product_quantity}}</span>
                                    <span class="badge badge-danger" v-else>Stock Out</span>
                                   
                                </div>
                            </div>
                            </button>
                        </div>
                   </div>
                </div>
                        
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <input type="text" class="form-control" v-model="searchTerm" style="width:600px; margin-bottom:10px;" placeholder="Search Here..">
                <div class="row">
                   <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="getproducts in getfilterSearch" :key="getproducts.id">
                        
                           <button class="btn btn-sm" @click.prevent="addToCart(getproducts.id)">
                            <div class="card" style="width: 8.5rem; margin-bottom:5px;">
                            <img :src="getproducts.image" id="em_photo" class="card-img-top">
                                <div class="card-body">
                                    <h6 class="card-title">{{getproducts.product_name}}</h6>
                                    <span class="badge badge-success" v-if="getproducts.product_quantity >=1 ">Available {{getproducts.product_quantity}}</span>
                                    <span class="badge badge-danger" v-else>Stock Out</span>
                                   
                                </div>
                            </div>
                            </button>
                        </div>
                   </div>
                    </div>
                
                </div>

                 
             

              
               
              </div>
            </div>
           
          </div>
          <!--Row-->

        

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
    this.allCategory();
    this.allCustomer();
    this.cartProducts();
    this.vat();

    this.$Reload.on("afterAdd", ()=>{
      this.cartProducts();
    });

  },

  data(){
    return{
      products: [],
      categories: '',
      getproducts: [],
      searchTerm: '',
      customers: '',
      carts: [],
      vats: []
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.products.filter(product =>{
        return product.product_name.toLowerCase().includes(searchTermLower);
      })
    },

    getfilterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.getproducts.filter(getproduct =>{
        return getproduct.product_name.toLowerCase().includes(searchTermLower);
      })
    },

    qty()
    {
      let sum =0;
      for(let i=0; i<this.carts.length; i++)
      {
        sum += (parseFloat(this.carts[i].pro_quantity));
      }
      return sum;
    },
    subtotal()
    {
      let sum =0;
      for(let i=0; i<this.carts.length; i++)
      {
        sum += (parseFloat(this.carts[i].pro_quantity) * (parseFloat(this.carts[i].product_price)));
      }
      return sum;
    },



  },


  methods:{
    //add to cart method

    addToCart(id)
    {
      axios.post('/api/addtocart/'+id)
      .then(() => {
        this.$Reload.emit("afterAdd");
        Toast.fire({
            icon: "success",
            title: "successfully done Pos Product insert"
        });

      })
      .catch()

    },

    removeItem(id)
    {
      axios.get('/api/remove/cart/'+id)
      .then(() => {
        this.$Reload.emit("afterAdd");
        Toast.fire({
            icon: "success",
            title: "successfully done Pos Cart Item"
        });

      })
      .catch()

    },

    increment(id){
      axios.get('/api/increment/'+id)
      .then(() => {
        this.$Reload.emit("afterAdd");
      })
      .catch()

    },
    decrement(id){
      axios.get('/api/decrement/'+id)
      .then(() => {
        this.$Reload.emit("afterAdd");
      })
      .catch()
    },

    vat(){
      axios.get('/api/vats')
      .then(({data}) => (this.vats = data))
      .catch()
    },

    cartProducts(){
      axios.get('/api/cart/product')
      .then(({data}) => (this.carts = data))
      .catch()
    },

    allProducts(){
      axios.get('/api/product')
      .then(({data}) => (this.products = data))
      .catch()
    },

    allCategory(){
      axios.get('/api/category')
      .then(({data}) => (this.categories = data))
      .catch()
    },
    allCustomer(){
      axios.get('/api/customer')
      .then(({data}) => (this.customers = data))
      .catch()
    },
    subProduct(id){
      axios.get('/api/getting/product/'+id)
      .then(({data}) => (this.getproducts = data))
      .catch()
    },

   
   
  }


 

}

</script>

<style type="text/css" scoped>
  #em_photo{
    width:100px;
    height:135px;
  }

</style>