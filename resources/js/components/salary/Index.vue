<template>

<div>

<div class="row">
    <router-link to="/given-salary" class="btn btn-primary">Pay Salary</router-link>
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
                  <h6 class="m-0 font-weight-bold text-primary">All Salary Details </h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Month Name</th> 
                        <th>Details</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="salary in filterSearch" :key="salary.id">
                        <td>{{salary.salary_month}}</td>
                       
                        <td>
                          <router-link :to="{name: 'viewSalary', params:{id:salary.salary_month}}" class="btn btn-sm btn-primary">
                            View Salary
                        </router-link>
                        
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


export default {

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    };

    this.allSalary();

  },

  data(){
    return{
        salaries: [],
        searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.salaries.filter(salary =>{
        return salary.salary_month.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allSalary(){
      axios.get('/api/salary')
      .then(({data}) => (this.salaries = data))
      .catch()
    },

 
  }


 

}

</script>

<style type="text/css">
  #em_photo{
    width:80px;
    height:80px;
  }

</style>