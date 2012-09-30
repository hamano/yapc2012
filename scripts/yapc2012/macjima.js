i=1,n=1,sum=2;
while(s=Math.sqrt(i+=2)){
  for(j=1;s>(j+=2)&&i%j!=0;);
  if(j>s&&(sum+=i)&&++n==10000)break;
}
console.log(sum);

