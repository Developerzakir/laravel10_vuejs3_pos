<template>

<div>

<div class="row">
    <router-link to="/salary" class="btn btn-primary">Go Back</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Update Salary</h1>
                  </div>
                  <form class="user" @submit.prevent="salaryUpdate">

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

                            <input type="hidden" v-model="form.employee_id">

                            <div class="col-md-6">
                            <label for="exampleFormControlSelect1"><b>Amount</b></label>
                               <input type="text" class="form-control" v-model="form.amount" id="exampleInputFirstName"  placeholder="Enter Your Salary">
                               
                            </div>
                        </div>
                    </div>
                    

                    
                  

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Update</button>
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
            amount: '',
            employee_id: ''
          
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
    axios.get('/api/edit/salary/'+id)
    .then(({data}) =>(this.form = data))
    .catch(console.log('error'))
  },

  methods:{
   
    salaryUpdate(){
        let id = this.$route.params.id;
      axios.post("/api/salary/update/"+id,this.form)
      .then(() =>{

        this.$router.push({name: 'allSalary'});

           Toast.fire({
            icon: "success",
            title: "successfully salary update"
          });
      })

      .catch(error => this.errors = error.response.data.errors)

    },


  }


 

}

</script>