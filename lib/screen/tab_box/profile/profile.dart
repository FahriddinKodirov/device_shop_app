import 'package:device_shop_app/data/servicers/file_uploader.dart';
import 'package:device_shop_app/utils/images.dart';
import 'package:device_shop_app/view_models/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String image_url = '';
  bool isLoading = false;


  final formKey = GlobalKey<FormState>();
  var accontName = 'Fahriddin';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.23,
          child: Consumer<ProfileViewModel>(
            builder:(context, profileViewModel, child) {
              return  profileViewModel.user != null? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
              color: Colors.black,
              
            child: Padding(
              padding: const EdgeInsets.only(right: 22,left: 22, top: 50),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color: Colors.teal[100],  
                borderRadius: BorderRadius.circular(12)
                ),
                
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    
               
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: profileViewModel.user!.photoURL == null
                          ? Image.network("https://mobimg.b-cdn.net/v3/fetch/ca/ca545d8a06207b86951a62e147a8b7b9.jpeg")
                          : Image.network(
                              profileViewModel.user!.photoURL!,
                            ),
                        
                      ),
                    ),
                  
                    Container(
                        child: Text('Fahriddin',
                            style: TextStyle(
                                fontSize: 25,
                                ))),
                    
                  
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('settings',
                            style: TextStyle(
                                color: Colors.black54))),
                    InkWell(
                        onTap: (() {
                     
                        }),
                        child: titleWidget(
                            MyImages.setting, 'App Settings')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('Account',
                            style: TextStyle(
                                color:Colors.black54))),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: titleWidget(MyImages.account_name,
                          'Change account name'),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    ExpansionTileWidget(context,MyImages.account_password,'Change account password'),
                   
                   
                    SizedBox(
                      height: 2,
                    ),
                    InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: titleWidget(MyImages.account_image,
                          'Change account Image', ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('Uptodo',
                            style: TextStyle(
                                color:Colors.black54))),
                    titleWidget(MyImages.about_us, 'About US'),
                    SizedBox(
                      height: 2,
                    ),
                    titleWidget(MyImages.faq, 'FAQ'),
                    SizedBox(
                      height: 2,
                    ),
                    titleWidget(
                         MyImages.help_feedback, 'Help & Feedback'),
                    SizedBox(
                      height: 2,
                    ),
                    titleWidget(MyImages.support, 'Support US'),
                    ListTile(
                      onTap: () {
                         FirebaseAuth.instance.signOut();
                      },
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: SvgPicture.asset(
                          MyImages.login_out,
                          width: 26,
                        ),
                      ),
                      title: Text(
                        'Log out',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ):Center(child: CircularProgressIndicator());
       
         
   } ))
      ),
    );
  }
void _showPicker(context){
  showModalBottomSheet(
    backgroundColor: Colors.black,
    context: context, 
    builder: (BuildContext bc){
      return SafeArea(child: Wrap(children: <Widget>[
        ListTile( 
         leading: const Icon(Icons.photo_library,color: Colors.white,),
         title: const Text("Gallery",style: TextStyle(color: Colors.white),),
         onTap: () {
           _getFromGallery();
           Navigator.of(context).pop();
         },
        ),
        ListTile(
                  leading: const Icon(Icons.photo_camera,color: Colors.white,),
                  title: const Text('Camera',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
      ],));
    });
}
  _getFromGallery()async {
    XFile? pickedFile = await _picker.pickImage(
       maxWidth: 1000,
       maxHeight: 1000,
       source: ImageSource.gallery,
    );
    if(pickedFile != null){
      if(!mounted)return;
      setState(() {
        isLoading = true;
      });
      if(!mounted) return;
      image_url = await FileUploader.imageUploader(pickedFile);
      if(!mounted) return;
      Provider.of<ProfileViewModel>(context, listen: false)
      .updatePhoto(image_url);
      setState(() {
        isLoading = false;
        _image = pickedFile;
    });
    }
  }
  _getFromCamera()async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
     if (pickedFile != null) {
      if (!mounted) return;
      image_url = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      Provider.of<ProfileViewModel>(context, listen: false).updatePhoto(image_url);
      setState(() {
        _image = pickedFile;
      });
    }
  }




  Widget titleWidget(icon, word) {
    return Container(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: SvgPicture.asset(
            icon,
            width: 26,
            color:Colors.black,
          ),
        ),
        title: Text(
          word,
          style: TextStyle(
              color:Colors.black, fontSize: 18),
        ),
        trailing: SvgPicture.asset(
          MyImages.right,
          width: 26,
          color:Colors.black,
        ),
      ),
    );
  }

  ExpansionTileWidget(context, icon, word,){
    return ExpansionTile(
      leading: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
        child: SvgPicture.asset(icon,width: 26,color:Colors.black, ),
      ),
      title: Text(word,style: TextStyle(color:Colors.black,fontSize: 18),),
      trailing: InkWell(
       
        child: SvgPicture.asset(MyImages.right,width: 26,color: Colors.black,)),
      children: [
      Container(
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.85,
        decoration: BoxDecoration(
         color:Colors.black.withOpacity(0.2), 
         borderRadius: BorderRadius.circular(8)
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text('${FirebaseAuth.instance.currentUser?.email.toString()}',style: TextStyle(fontSize: 25),),
          ),
        ),
      )
      ],
    );
}
}




