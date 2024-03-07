import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//the show dialog  is used to display a pop up message when the and it should be in a seperate function here

class GetDataFromFirestore extends StatefulWidget {
  final String documentId;

  const GetDataFromFirestore({
    super.key,
    required this.documentId,
  });

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final credential = FirebaseAuth.instance.currentUser;
  final ageController = TextEditingController();
  final usernameController = TextEditingController();
  final titleController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Email : ${data['email']}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Edit Email'),
                            content: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: 'Enter new email',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  users
                                      .doc(credential!.uid)
                                      .update({"email": emailController.text});
                                  setState(() {
                                    data["email"] = emailController.text;
                                  });
                                  emailController.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Username : ${data['username']}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Edit Username'),
                            content: TextField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Enter new username',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  users.doc(credential!.uid).update(
                                      {"username": usernameController.text});
                                  setState(() {
                                    data["username"] = usernameController.text;
                                  });
                                  usernameController.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Age : ${data['age']}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Edit Age'),
                            content: TextField(
                              controller: ageController,
                              decoration: const InputDecoration(
                                hintText: 'Enter new age',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  users
                                      .doc(credential!.uid)
                                      .update({"age": ageController.text});
                                  setState(() {
                                    data["age"] = ageController.text;
                                  });
                                  ageController.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title : ${data['title']}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Edit Title'),
                            content: TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                hintText: 'Enter new title',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  users
                                      .doc(credential!.uid)
                                      .update({"title": titleController.text});
                                  setState(() {
                                    titleController.clear();
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
              ],
            ),
          );
        }

        return const SizedBox(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
