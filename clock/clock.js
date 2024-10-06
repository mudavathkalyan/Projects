setInterval(()=>
{
    let d=new Date();
    let h=d.getHours()%12;//12 hours mode..not 24
    let m=d.getMinutes();
    let s=d.getSeconds();

    let hourRotate=(30*h )+ (m/2);
    let minuteRotate=6*m;
    let secondRotate=6*s;
    let hour=document.querySelector("#hour");
    let sec=document.querySelector("#second");
    let minutes=document.querySelector("#minute");

    sec.style.transform=`rotate(${secondRotate}deg)`;
    minutes.style.transform=`rotate(${minuteRotate}deg)`;
    hour.style.transform=`rotate(${hourRotate}deg)`;
    let setTime=document.querySelector("#displayTime");
    setTime.innerHTML=`${h}:${m}:${s}`;
},1000);
