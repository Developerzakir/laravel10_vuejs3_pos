<template>

<div>

<div class="row">
    <router-link to="/store-customer" class="btn btn-primary">Add Customer</router-link>
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
                  <h6 class="m-0 font-weight-bold text-primary">Customers Lists</h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Name</th>
                        <th>Photo</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="customer in filterSearch" :key="customer.id">
                        <td><a href="#">{{customer.name}}</a></td>
                        <td><a href="#">
                          <img :src="customer.photo" id="em_photo" alt="">
                        </a></td>
                        <td><a href="#">{{customer.phone}}</a></td>
                        <td><a href="#">{{customer.email}}</a></td>
                        <td><a href="#">{{customer.address}}</a></td>
                       
                       
                        <td>
                          <router-link :to="{name: 'editCustomer', params:{id:customer.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="customerDelete(customer.id)" class="btn btn-sm btn-danger">Delete</a>
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

    this.allCustomers();

  },

  data(){
    return{
      customers: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.customers.filter(customer =>{
        return customer.name.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allCustomers(){
      axios.get('/api/customer')
      .then(({data}) => (this.customers = data))
      .catch()
    },

    customerDelete(id){
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
            axios.delete('/api/customer/'+id)
            .then(()=>{
              this.employees = this.customers.filter(customer =>{
                return customer.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Customer'})
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