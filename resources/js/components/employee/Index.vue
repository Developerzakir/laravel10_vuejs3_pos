<template>

<div>

<div class="row">
    <router-link to="/store-employee" class="btn btn-primary">Add Employee</router-link>
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
                        <th>Salary</th>
                        <th>Joining Date</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="employee in filterSearch" :key="employee.id">
                        <td><a href="#">{{employee.name}}</a></td>
                        <td><a href="#">
                          <img :src="employee.photo" id="em_photo" alt="">
                        </a></td>
                        <td><a href="#">{{employee.phone}}</a></td>
                        <td>{{employee.salary}}</td>
                        <td>{{employee.joining_date}}</td>
                       
                        <td>
                          <router-link :to="{name: 'EditEmployee', params:{id:employee.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="employeeDelete(employee.id)" class="btn btn-sm btn-danger">Delete</a>
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

    this.allEmployee();

  },

  data(){
    return{
      employees: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.employees.filter(employee =>{
        return employee.name.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allEmployee(){
      axios.get('/api/employee')
      .then(({data}) => (this.employees = data))
      .catch()
    },

    employeeDelete(id){
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
            axios.delete('/api/employee/'+id)
            .then(()=>{
              this.employees = this.employees.filter(employee =>{
                return employee.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Employee'})
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