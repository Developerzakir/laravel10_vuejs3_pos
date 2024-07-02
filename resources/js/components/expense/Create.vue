<template>

<div>

<div class="row">
    <router-link to="/expense" class="btn btn-primary">All Expense</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Add Expense</h1>
                  </div>
                  <form class="user" @submit.prevent="expenseInsert">

                   
                    <div class="form-group">
                      <label for="exampleFormControlTextarea1"><b>Expense Details</b></label>
                      <textarea class="form-control" v-model="form.details" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                      <label for=""><b>Expense Amount</b></label>
                      <input type="text" class="form-control" id="" placeholder="Enter expense amount"
                             v-model="form.amount">
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


export default {

 

  data(){
    return{
        form: {
            details: null,
            amount: null,
        },

        errors: {}
      
    }
  },

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    }
    console.log(this.form);

  },

  methods:{
 

    expenseInsert(){
      axios.post("/api/expense",this.form)
      .then(() =>{

        this.$router.push({name: 'Expense'});

           Toast.fire({
            icon: "success",
            title: "successfully expense inserted "
          });
      })

      .catch(error => {
            if (error.response) {
                // The request was made and the server responded with a status code that falls out of the range of 2xx
                this.errors = error.response.data.errors;
            } else if (error.request) {
                // The request was made but no response was received
                console.log(error.request);
            } else {
                // Something happened in setting up the request that triggered an Error
                console.log('Error', error.message);
            }
    });

    },


  }


 

}

</script>