//
//6n+-1付近のみを探索すると
//
//1. 2と3の倍数は6n+-1とは重ならない
//2. 6n+-1の6k+-1倍のみ「素数でない」フラグを立てればいい
//
//もうちょっとだけ速くなるんじゃよ

function sum_primes(prime_number){
  if(prime_number <= 5){
    var primes = [2,3,7,11,13];
    var sum = 0;
    for(var i = 0; i < prime_number;i++){
      sum = sum + primes[i];
    
    }
    
    return sum;
  
  }
  
  var ln_pn = Math.log(prime_number);
  
  var max_canditate = Math.floor(prime_number * (ln_pn + (Math.log(ln_pn))));
  var numbers = new Buffer(max_canditate);
  numbers.fill(1);
  var sum = 5;
  var base = 0;
  var tick_number = 0;
  var estep_base      = 0;
  var unflag_index   = 0;
  var is_prime_m = 1,is_prime_p = 1,index_m = 0,index_p = 0;
  var break_flag = false;
  prime_number = prime_number -2;
  

  while(true){
    base = base + 6;
    index_m = base - 1;
      index_p = base + 1;
  
  
    is_prime_m = numbers[index_m];
    if(is_prime_m === 1){
      
      sum = sum + index_m;
      
      prime_number --;
      if(prime_number === 0){
        return sum;
        
      }
      estep_base = 0;
      while(true){
        estep_base  = estep_base + 6;
      
        cut_index = (estep_base -1 ) * index_m  ;
        if(cut_index > max_canditate){
            break;
        
        }
        numbers[cut_index] = 0;
      
        cut_index = (estep_base + 1 ) * index_m  ;
        if(cut_index > max_canditate){
      
            break;
        
        }
        numbers[cut_index] = 0;
      }
    }

    is_prime_p = numbers[index_p];
    if (is_prime_p === 1){
      
      sum = sum + index_p;
      prime_number --;
      if(prime_number === 0){
        return sum;
        
      }
      estep_base  = 0
      while(true){
        estep_base  = estep_base + 6;
      
        cut_index = (estep_base -1 ) * index_p  ;
        if(cut_index > max_canditate){
            break;
        
        }
        numbers[cut_index] = 0;
      
        cut_index = (estep_base + 1 ) * index_p  ;
        if(cut_index > max_canditate){
      
            break;
        
        }
        numbers[cut_index] = 0;
      }
      
    }
  
  }
}
console.log(sum_primes(10000));

