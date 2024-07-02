<template>

<div>

<div class="row">
    <router-link to="/store-supplier" class="btn btn-primary">Add Supplier</router-link>
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
                        <th>Photo</th>
                        <th>Phone</th>
                        <th>Shop Name</th>
                        <th>Email</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="supplier in filterSearch" :key="supplier.id">
                        <td><a href="#">{{supplier.name}}</a></td>
                        <td><a href="#">
                          <img :src="supplier.photo" id="em_photo" alt="">
                        </a></td>
                        <td><a href="#">{{supplier.phone}}</a></td>
                        <td><a href="#">{{supplier.shopname}}</a></td>
                        <td><a href="#">{{supplier.email}}</a></td>
                       
                       
                        <td>
                          <router-link :to="{name: 'editSupplier', params:{id:supplier.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="supplierDelete(supplier.id)" class="btn btn-sm btn-danger">Delete</a>
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

    this.allSuppliers();

  },

  data(){
    return{
      suppliers: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.suppliers.filter(supplier =>{
        return supplier.name.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allSuppliers(){
      axios.get('/api/supplier')
      .then(({data}) => (this.suppliers = data))
      .catch()
    },

    supplierDelete(id){
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
            axios.delete('/api/supplier/'+id)
            .then(()=>{
              this.suppliers = this.suppliers.filter(supplier =>{
                return supplier.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Supplier'})
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