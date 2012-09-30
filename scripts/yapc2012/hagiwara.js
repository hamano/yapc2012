//関数呼び出しコストを0に
//可読性も0に
//構造データへのアクセスも四則演算に比べて重いのでやらない
//マルチスレッド化でこれ以上速くなるかは疑問


function sum_primes(prime_number){
  prime_number = prime_number -2;
  var step         = 0;
  var base         = 0;
  var sum          = 5;
  var value        = 0;
  var test_base    = 0;
  var tester = 0;
  var flag         = true;
  while(true){
    step ++;
    base = base + 6;
    value = base -1;
    
    if(value % 2 !== 0 && value % 3 !== 0){
      flag         = true;
      test_base    = 0;
      
    
  
    
      for(var i = 0;i<step; i++){
        test_base = test_base + 6;
        tester = test_base -1;
        if(value % tester === 0){
          if(i !== step -1 ){
            flag = false;
            break;
          }
      
    
        }
        if(tester * tester > value){
          flag = false;
          sum = sum + value;
          prime_number --;
          if(prime_number === 0){
            return sum;
      
          }
          break;
    
        }
        tester = test_base + 1;
        if(value % tester === 0){
          flag  = false;
          break;
    
        }
        if(tester * tester > value){
          flag  = false;
          sum = sum + value;
          prime_number --;
          if(prime_number === 0){
            return sum;
      
          }
          break;
    
        }
  
      }
      if (flag == true){
        sum = sum + value;
        prime_number --;
        if(prime_number === 0){
            return sum;
      
        }
      }
    }
    value = base + 1;   
    
    if(value % 2 !== 0 && value % 3 !== 0){
      flag = true;
      test_base = 0;
      for(var i = 0;i<step; i++){
        test_base = test_base + 6;
        tester = test_base -1;
        if(value % tester === 0){
          flag = false;
          break;
        
      
    
        }
        if(tester * tester > value){
          flag = false;
          sum = sum + value;
          prime_number --;
          if(prime_number === 0){
            return sum;
      
          }
          break;
    
        }
        tester = test_base + 1;
        if(value % tester === 0){
          if(i !== step -1 ){
            flag = false;
            break;
          }
        
        
    
        }
        if(tester * tester > value){
          flag = false;
          sum = sum + value;
          prime_number --;
          if(prime_number === 0){
            return sum;
      
          }
          break;
    
        }
  
      }
      if(flag == true){
        sum = sum + value;
        prime_number --;
        if(prime_number === 0){
          return sum;
      
        }
      }
    }
  

  }
  

}

console.log(sum_primes(10000));

