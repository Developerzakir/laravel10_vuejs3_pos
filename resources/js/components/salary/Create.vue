<template>

<div>

<div class="row">
    <router-link to="/employee" class="btn btn-primary">All Employee</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Pay Salary</h1>
                  </div>
                  <form class="user" @submit.prevent="salaryPaid">

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1"><b>Name</b></label>
                            <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Full Name"
                             v-model="form.name">
                            
                            </div>
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1"><b>Email</b></label>
                               <input type="email" class="form-control" v-model="form.email"   placeholder="Enter Your Email">
                               
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleFormControlSelect1"><b>Month</b></label>
                                <select v-model="form.salary_month" class="form-control form-select" id="exampleFormControlSelect1">
                             
                                    <option value="January">January</option> 
                                    <option value="February">February</option> 
                                    <option value="March">March</option> 
                                    <option value="April">April</option> 
                                    <option value="May">May</option> 
                                    <option value="June">June</option> 
                                    <option value="July">July</option> 
                                    <option value="August">August</option> 
                                    <option value="September">September</option> 
                                    <option value="October">October</option> 
                                    <option value="November">November</option> 
                                    <option value="December">December</option> 
                                </select>
                            </div>
                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1"><b>Salary</b></label>
                               <input type="text" class="form-control" v-model="form.salary" id="exampleInputFirstName"  placeholder="Enter Your Salary">
                               
                            </div>
                        </div>
                    </div>
                    

                    
                  

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Pay Now</button>
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


export default {

 

  data(){
    return{
        form: {
            name: '',
            email: '',
            salary_month: '',
            salary: '',
          
        },

        errors: []
      
    }
  },

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    }
    console.log(this.form);

    let id = this.$route.params.id;
    axios.get('/api/employee/'+id)
    .then(({data}) =>(this.form = data))
    .catch(console.log('error'))
  },

  methods:{
   

    salaryPaid(){
        let id = this.$route.params.id;
      axios.post("/api/salary/paid/"+id,this.form)
      .then(() =>{

        this.$router.push({name: 'Salary'});

           Toast.fire({
            icon: "success",
            title: "successfully salary paid"
          });
      })

      .catch(error => this.errors = error.response.data.errors)

    },


  }


 

}

</script>