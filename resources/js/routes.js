
import Login from './components/login.vue';
import Register from './components/Register.vue';
import Forget from './components/Forget.vue';
import Home from './components/Home.vue';
import Logout from './components/Logout.vue';
import storeEmployee from './components/employee/Create.vue';
import Employee from './components/employee/Index.vue';
import EditEmployee from './components/employee/Edit.vue';
import storeSupplier from './components/supplier/Create.vue';
import Supplier from './components/supplier/Index.vue';
import editSupplier from './components/supplier/Edit.vue';

import storeCategory from './components/category/Create.vue';
import Category from './components/category/Index.vue';
import editCategory from './components/category/Edit.vue';

import storeProduct from './components/product/Create.vue';
import Product from './components/product/Index.vue';
import editProduct from './components/product/Edit.vue';

import storeExpense from './components/expense/Create.vue';
import Expense from './components/expense/Index.vue';
import editExpense from './components/expense/Edit.vue';

import Salary from './components/salary/all_employee.vue';
import paySalary from './components/salary/Create.vue';
import allSalary from './components/salary/Index.vue';
import viewSalary from './components/salary/View.vue';
import editSalary from './components/salary/Edit.vue';

import Stock from './components/product/Stock.vue';
import editStock from './components/product/Edit-Stock.vue';


import storeCustomer from './components/customer/Create.vue';
import Customer from './components/customer/Index.vue';
import editCustomer from './components/customer/Edit.vue';



import Pos from './components/pos/Pointofsale.vue';


const routes = [
    { 
        path: '/',
        component: Login,
        name:'Login' 
    },

    { 
        path: '/register', 
        component: Register, 
        name:'Register'
     },
     { 
        path: '/forget', 
        component: Forget, 
        name:'Forget'
     },

     { 
        path: '/home', 
        component: Home, 
        name:'Home'
     },
     { 
        path: '/logout', 
        component: Logout, 
        name:'Logout'
     },
     //authentication part end



     //Employeer 
     { 
      path: '/store-employee', 
      component: storeEmployee, 
      name:'storeEmployee'
     },
     { 
      path: '/employee', 
      component: Employee, 
      name:'Employee'
     },
     { 
      path: '/edit-employee/:id', 
      component: EditEmployee, 
      name:'EditEmployee'
     },

     //Supplier
     { 
      path: '/store-supplier', 
      component: storeSupplier, 
      name:'storeSupplier'
     },
     { 
      path: '/supplier', 
      component: Supplier, 
      name:'Supplier'
     },
     { 
      path: '/edit-supplier/:id', 
      component: editSupplier, 
      name:'editSupplier'
     },
     
     //Category
     { 
      path: '/store-category', 
      component: storeCategory, 
      name:'storeCategory'
     },
     { 
      path: '/category', 
      component: Category, 
      name:'Category'
     },
     { 
      path: '/edit-category/:id', 
      component: editCategory, 
      name:'editCategory'
     },
     
     //Product
     { 
      path: '/store-product', 
      component: storeProduct, 
      name:'storeProduct'
     },
     { 
      path: '/product', 
      component: Product, 
      name:'Product'
     },
     { 
      path: '/edit-product/:id', 
      component: editProduct, 
      name:'editProduct'
     },
     
     //expense
     { 
      path: '/store-expense', 
      component: storeExpense, 
      name:'storeExpense'
     },
     { 
      path: '/expense', 
      component: Expense, 
      name:'Expense'
     },
     { 
      path: '/edit-expense/:id', 
      component: editExpense, 
      name:'editExpense'
     },
     
     //salary
     { 
      path: '/given-salary', 
      component: Salary, 
      name:'Salary'
     },
    
     { 
      path: '/pay-salary/:id', 
      component: paySalary, 
      name:'paySalary'
     },
     { 
      path: '/salary', 
      component: allSalary, 
      name:'allSalary'
     },
     { 
      path: '/view-salary/:id', 
      component: viewSalary, 
      name:'viewSalary'
     },
     { 
      path: '/edit-salary/:id', 
      component: editSalary, 
      name:'editSalary'
     },

     //stock
     { 
      path: '/stock', 
      component: Stock, 
      name:'Stock'
     },

     { 
      path: '/edit-stock/:id', 
      component: editStock, 
      name:'editStock'
     },

     //customer
     { 
      path: '/store-customer', 
      component: storeCustomer, 
      name:'storeCustomer'
     },

     { 
      path: '/customer', 
      component: Customer, 
      name:'Customer'
     },
     { 
      path: '/edit-customer/:id', 
      component: editCustomer, 
      name:'editCustomer'
     },

     //pos
     { 
      path: '/pos', 
      component: Pos, 
      name:'Pos'
     },

     

     

     
    
  ];

export  default routes; 