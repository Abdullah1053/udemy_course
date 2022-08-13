
//onboardings models 
class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image); 


  }


class SliderViewObject{
SliderObject sliderObject;
int numOfSlides;
int currentIndexs;
SliderViewObject(this.sliderObject,this.numOfSlides,this.currentIndexs);

}

//login page 

class Customer{
  String id;
  String name;
  int numOfNotification;

  Customer(this.id,this.name,this.numOfNotification);
}
class Contacts{
   String email;
  String messages;
  String link;
  Contacts(this.email, this.link, this.messages);
}

class Authentication{
  Customer? customer;
  Contacts? contacts;
 

Authentication(this.contacts,this.customer);
}