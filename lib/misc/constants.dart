import 'package:bein_mobile/blocs/auth/auth_bloc.dart';
import 'package:bein_mobile/misc/colors.dart';
import 'package:bein_mobile/models/user/user.dart';
import 'package:bein_mobile/services/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

User user = User();

// This will have things like a profile builder in it to make life easier.
class ConstAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ConstAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ListColors.mainColor,
      title: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "B E I N",
              style: TextStyle(
                color: ListColors.whiteColor,
                fontSize: 20,
              ),
            ),
            Text(
              "Built Environment Innovative Network",
              style: TextStyle(
                color: ListColors.whiteColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {
              AppNavigator.pushReplacement(context, '/searchAndFilter');
              // Navigator.pushNamed(context, RouteManager.searchAndFilter);
            },
            icon: const Icon(
              Icons.search,
              size: 28,
              color: ListColors.whiteColor,
            ),
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AdminConstAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminConstAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ListColors.mainColor,
      title: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "B E I N",
              style: TextStyle(
                color: ListColors.whiteColor,
                fontSize: 20,
              ),
            ),
            Text(
              "Built Environment Innovative Network",
              style: TextStyle(
                color: ListColors.whiteColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list_alt_outlined,
              size: 28,
              color: ListColors.whiteColor,
            ),
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//The heading and the TopPick on the landing page
class Heading extends StatelessWidget {
  final String heading;
  const Heading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}

class TopPick extends StatelessWidget {
  final String pick;
  const TopPick({
    super.key,
    required this.pick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: const BoxDecoration(
            color: ListColors.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(27))),
        height: 100,
        width: 200,
        child: Center(
          child: Text(
            pick,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class Media extends StatelessWidget {
  //This will carry relevant information.
  const Media({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ListColors.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(27))),
      height: 250,
      width: 420,
      child: const Center(
        child: Text(
          "Image will be placed here",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

// Drawer properties
class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: ListColors.mainColor),
              // Current account picture to display the users picture
              currentAccountPicture: CircleAvatar(),
              //Replace with actual information the will be recieved from the API
              accountName: Text(
                "Henderson Mark",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(
                "mark@gmail.com",
                style: TextStyle(fontSize: 16),
              )),
          NavBarItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              //Navigate user to landing page
              AppNavigator.pushReplacement(context, '/landingPage');
              // Navigator.pushNamed(context, RouteManager.landingPage);
            },
          ),
          NavBarItem(
            icon: Icons.sim_card_sharp,
            title: "Contact Us",
            onTap: () {
              //Navigate user to specified location
            },
          ),
          NavBarItem(
            icon: Icons.home,
            title: "About Us",
            onTap: () {
              //Navigate user to specified location
            },
          ),
          NavBarItem(
            icon: Icons.person,
            title: "Account",
            onTap: () {
              //Navigate user to specified location
              AppNavigator.pushReplacement(context, '/accountInfo');
              // Navigator.pushNamed(context, RouteManager.accountInfo);
            },
          ),
          NavBarItem(
            icon: Icons.logout_outlined,
            title: "Log Out",
            onTap: () {
              //Navigate user to specified location
              context.read<AuthBloc>().add(SignOutRequest());
              AppNavigator.pop(context);

              // Navigator.popAndPushNamed(context, RouteManager.login);
            },
          ),
        ],
      ),
    );
  }
}

// Drawer properties
class AdminNavDrawer extends StatelessWidget {
  const AdminNavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: ListColors.mainColor),
              // Current account picture to display the users picture
              currentAccountPicture: CircleAvatar(),
              //Replace with actual information the will be recieved from the API
              accountName: Text(
                "Joe Ann",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(
                "ann@gmail.com",
                style: TextStyle(fontSize: 16),
              )),
          NavBarItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              //Navigate user to landing page
              AppNavigator.pushReplacement(context, '/adminLandingPage');

              // Navigator.pushNamed(context, RouteManager.adminLanding);
            },
          ),
          NavBarItem(
            icon: Icons.sim_card_sharp,
            title: "Contact Us",
            onTap: () {
              //Navigate user to specified location
            },
          ),
          NavBarItem(
            icon: Icons.home,
            title: "About Us",
            onTap: () {
              //Navigate user to specified location
            },
          ),
          NavBarItem(
            icon: Icons.person,
            title: "Account",
            onTap: () {
              //Navigate user to specified location
            },
          ),
          NavBarItem(
            icon: Icons.logout_outlined,
            title: "Log Out",
            onTap: () {
              //Navigate user to specified location
              context.read<AuthBloc>().add(SignOutRequest());
              AppNavigator.pop(context);

              // Navigator.pushNamed(context, RouteManager.login);
            },
          ),
        ],
      ),
    );
  }
}

// Drawer Items
class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const NavBarItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        // This will navigate the user to the specified pages
        onTap: onTap);
  }
}

class ProductContainer extends StatelessWidget {
  final String sofName;
  final String sofDescription;
  const ProductContainer(
      {super.key, required this.sofName, required this.sofDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 150,
      decoration: const BoxDecoration(
        color: ListColors.lowVis,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: ListColors.titles,
              ),
              child: const Center(
                child: Text(
                  "Image",
                  style: TextStyle(color: ListColors.whiteColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sofName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      sofDescription,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          AppNavigator.pushReplacement(
                              context, '/detailedSoftware');

                          // Navigator.pushNamed(
                          //     context, RouteManager.detailedSoftware);
                        },
                        child: const Text(
                          "Learn More",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Download",
                          style: TextStyle(color: ListColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Description on the detailed software page
class DetailedDescrip extends StatelessWidget {
  final String desc;
  const DetailedDescrip({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        desc,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
        softWrap: true,
      ),
    );
  }
}

//Title on the detailed software page
class DetailedTitle extends StatelessWidget {
  final String title;
  const DetailedTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Navigate to the Add Sector page or the Add Software Product page
class SectorOrProductButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SectorOrProductButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          decoration: const BoxDecoration(
              color: ListColors.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          height: 350,
          width: 350,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(color: ListColors.whiteColor, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
