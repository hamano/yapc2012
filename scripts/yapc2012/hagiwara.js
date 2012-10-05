//ジャッパスクリプト(最新)
//
//素数表の読み書きが予想外に重いので速くしてみた
//
//なぜか時々5回に数回くらいの割合で速度が10分の１になるorz


function sum_primes(prime_number){
  if(prime_number <= 5){
    var primes = [2,3,5,7,11];
    var sum = 0;
    for(var i = 0; i < prime_number;i++){
      sum = sum + primes[i];
    
    }
    
    return sum;
  
  }
  
  var ln_pn = Math.log(prime_number);
  
  var max_canditate = Math.floor(prime_number * (ln_pn + (Math.log(ln_pn)))/3);
  var numbers = new Buffer(max_canditate);
  numbers.fill(1);
  var sum = 5;
  var step = 0;
  var index = -1;
  var tick_number = 0;
  var unflag_index   = 0;
  var is_prime = 10;
  
  prime_number = prime_number -2;
  

  while(true){
    step ++;
    index ++;
    is_prime = numbers[index];
    if(is_prime === 1){
      
      sum = sum + step * 6 -1 ;
      
      prime_number --;
      if(prime_number === 0){
        return sum;
        
      }
      tick_number = 0;
      
      while(true){
        
        tick_number ++;

      
        unflag_index = (step * (6*tick_number - 1) - tick_number ) * 2 - 1  ;
        
        if(unflag_index > max_canditate){
      
          break;
        
        }
        numbers[unflag_index] = 0;
        
        unflag_index =(step * (6*tick_number + 1) - tick_number) * 2  - 2 ;
        
        if(unflag_index > max_canditate){
          break;            
        }
        numbers[unflag_index] = 0;
      }
    }
    
    index ++;
    is_prime = numbers[index];
    if(is_prime === 1){
      sum = sum + step * 6 + 1 ;
      
      prime_number --;
      
      if(prime_number === 0){
        return sum;
        
      }
      
      tick_number = 0;
      break_flag = false;
      while(true){
        
        tick_number ++;
        unflag_index =( step * (6*tick_number - 1) + tick_number )  * 2  - 2 ;
        
        if(unflag_index > max_canditate){
          break;
        
        }
        numbers[unflag_index] = 0;
        
        unflag_index =  ( step * (6*tick_number + 1) + tick_number )  * 2  - 1  ;
        
        if(unflag_index > max_canditate){
      
          break;
          
        }
        numbers[unflag_index] = 0;
      

      }
    }
  }
}

console.log(sum_primes(10000));


