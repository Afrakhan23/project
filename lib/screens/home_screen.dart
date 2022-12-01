import 'package:flutter/material.dart';


import '../models/list_models.dart';

class homescreen extends StatefulWidget {
  String username;
  String password;
  String gender;
  homescreen({required this.username, required this.password, required this.gender});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index = 0;

  List<HomeModel> cars = [
    HomeModel(
        name: "Afra",
        image: AssetImage("img1.jpeg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Afra "),
    HomeModel(
        name: "Aafrin",
        image: AssetImage("img1.jpeg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Aafrin "),
    HomeModel(
        name: "Rooban",
        image: AssetImage("img1.jpeg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Rooban"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 48, 48),
        title: Text("NETFIX"),
        actions: [
          IconButton(onPressed: (() {}), icon: Icon(Icons.search)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.more_vert))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return GridTile(
                    child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: cars[index].image,
                        radius: 50,
                      ),
                    ),
                    Container(
                      child: Text(cars[index].name),
                    ),
                    Container(
                      child: Text(cars[index].subtitle),
                    ),
                    Container(
                      child: cars[index].icon,
                    )
                  ],
                ));
              },
            )

                // // scrollDirection: Axis.horizontal,
                // children: [
                //   GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img1.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img2.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img3.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img4.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img5.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img6.jpg") ,radius: 30,)),

                //  Image(image: AssetImage("assets/img5.jpg"),)),
                //  GridTile(child: Image(image: AssetImage("assets/img4.jpg"),)),
                //   GridTile(child: Image(image: AssetImage("assets/img6.jpg"),)),
                //    GridTile(child: Image(image: AssetImage("assets/img.jpg"),)),
                //     GridTile(child: Image(image: AssetImage("assets/pixi1.jpg"),))

                ),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: cars[index].image,
                      radius: 20,
                    ),
                    title: Text(cars[index].name),
                    subtitle: Text(cars[index].subtitle),
                    trailing: cars[index].icon,
                  );
                },
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 42, 43, 43),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1633044088137-513d3804e9fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8UklERVJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")),
            SizedBox(
              height: 10,
            ),
            Text(
            widget.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 37, 37, 37),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("Favorite"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Call"),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 37, 37, 37),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                ),
                child: Text("Sign Out")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              // print(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.brown[400],
                ),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.brown[400],
                ),
                label: "Search",
                activeIcon: Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                  color: Colors.brown[400],
                ),
                label: "Downloads",
                activeIcon: Icon(
                  Icons.download,
                  size: 40,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Color.fromARGB(255, 15, 19, 18)),
    );
  }
}