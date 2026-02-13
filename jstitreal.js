// Online Javascript Editor for free
// Write, Edit and Run your Javascript code using JS Onlilet 
let objectExample =
{
                name : 'lokesh',
                age : 30,
                boolean : true,
                array :['abcd',30,true]
}

console.log(objectExample.age);
console.log(Object.values(objectExample))
console.log('-------persnality--------')
let  persnality ={}
persnality.name ='name'
persnality.age =30
persnality.city='nagpur'

persnality.hobbis =['creickat','readingbookd','erroe']
persnality.skills = {
    java : 'good',
    Cplus:'vgood',
    
}
console.log(persnality);

//----------for loop demo----------
// Online Typescript Editor for free
// Write, Edit and Run your Typescript code using TS Online Compiler

for(let i=0;i<=10;i++)
{
    console.log(i)
}

// for array for loop in javascript we use of 
let Arreydata =['abcd',30,true]

for(let book of Arreydata)
{
    console.log("book array:"+book)
}

//console.log(Arreydata)

//for object loop in javascript we use of

let objectdata ={name : "abcd" ,age:30 ,male :true}

for(let person in objectdata)
{
    console.log('data is:'+person)
}
//--------------spread opreter-----------

//----------------------spred opreters--------------//
console.log('abcd')

let actorsname =['salaman','boby','kat']

let addMoreActor=['srk',...actorsname,'raghav']
console.log(addMoreActor)
//copy and array in spread opreeters
let Numbr =['2','7','9']
let adnum =['jkbklb']
console.log([...adnum,...Numbr]);

let name ={name : 'abcd',age:30}
let dob ={age:'26/9/45'}
console.log({...dob,...name})


function addNumbers(a,b,c)
{
    return a+b+c;
}
    let num =[4,5,8]
let resulst =(addNumbers(...num))
console.log(resulst)


let dcHeros ={name :'loki',city:'aisgard'}


let Marvels =['caption america','hulk','tony']

let marvels2 =['superman','batman','shatiman']

console.log([...Marvels,...marvels2,],{dcHeros})



//------------error handling in js ---------------
try{
    let num = 'lokesh'
  
    console.log('my name is '+num)
}
catch(error)
{
    console.log(error.message)
}

let booksType =['A','B','C'];

try{
    
    function booksShop(booksname)
{
    if(!booksType.includes(booksname))
    {
        //throw new Error(`sorry, we dont have ${booksname}`)
        console.log('sorry we dont have book '+booksname)
    }
    else
    {
        console.log('yes we have books '+booksname)
    }
    
}
    
}
catch(error)
{
    console.log(error.message);
}
finally{
    console.log('got it')
}

booksShop('A');
booksShop('D');


