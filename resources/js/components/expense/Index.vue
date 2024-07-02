<template>

<div>

<div class="row">
    <router-link to="/store-expense" class="btn btn-primary">Add Expense</router-link>
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
                  <h6 class="m-0 font-weight-bold text-primary">Expense Lists</h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Expense Details</th>
                        <th>Expense Amount</th>
                        <th>Expense Generate Date</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="expense in filterSearch" :key="expense.id">
                        <td><a href="#">{{expense.details}}</a></td> 
                        <td><a href="#">{{expense.amount}}</a></td> 
                        <td><a href="#">{{expense.expense_date}}</a></td> 
                        <td>
                          <router-link :to="{name: 'editExpense', params:{id:expense.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="expenseDelete(expense.id)" class="btn btn-sm btn-danger">Delete</a>
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

    this.allExpense();

  },

  data(){
    return{
      expenses: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.expenses.filter(expense =>{
        return expense.details.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allExpense(){
      axios.get('/api/expense')
      .then(({data}) => (this.expenses = data))
      .catch()
    },

    expenseDelete(id){
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
            axios.delete('/api/expense/'+id)
            .then(()=>{
              this.expenses = this.expenses.filter(expense =>{
                return expense.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Expense'})
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