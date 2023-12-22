import 'package:deteksi_hama/configs/app_colors.dart';
import 'package:deteksi_hama/configs/font_family.dart';
import 'package:deteksi_hama/screens/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('deteksi_tikus');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('deteksi_tikus');
  DatabaseReference sensorReference =
      FirebaseDatabase.instance.ref().child('sensor');
  DatabaseReference alatReference = FirebaseDatabase.instance.ref();

  final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Hai, \nSelamat Datang",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: FontFamily.bold, fontSize: 28.sp)),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors
                            .white, // Ganti dengan warna latar belakang yang Anda inginkan
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            spreadRadius: 1, // Lebar bayangan
                            blurRadius: 5, // Tingkat blur
                            offset: const Offset(0, 3), // Geser bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 10.w),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Kondisi Lingkungan",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.textgrey),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Image.asset('assets/images/world.png',
                                    width: 50.w, height: 50.h),
                                StreamBuilder(
                                    stream:
                                        sensorReference.child('ldr').onValue,
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      return Text(
                                        snapshot.data!.snapshot.value
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.dark),
                                      );
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            spreadRadius: 1, // Lebar bayangan
                            blurRadius: 5, // Tingkat blur
                            offset: const Offset(0, 3), // Geser bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 10.w),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Jumlah Perangkat",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.textgrey),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Image.asset('assets/images/iot.png',
                                    width: 50.w, height: 50.h),
                                StreamBuilder(
                                  stream: alatReference
                                      .child('jumlah_alat')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        ' ' +
                                            snapshot.data!.snapshot.value
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.dark),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors
                            .white, // Ganti dengan warna latar belakang yang Anda inginkan
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            spreadRadius: 1, // Lebar bayangan
                            blurRadius: 5, // Tingkat blur
                            offset: const Offset(0, 3), // Geser bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 10.w),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Deteksi Gerakan",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.textgrey),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            StreamBuilder(
                              stream: sensorReference.child('pir').onValue,
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    snapshot.data!.snapshot.value.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: AppColors.dark,
                                        fontFamily: FontFamily.bold),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors
                            .white, // Ganti dengan warna latar belakang yang Anda inginkan
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            spreadRadius: 1, // Lebar bayangan
                            blurRadius: 5, // Tingkat blur
                            offset: const Offset(0, 3), // Geser bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 10.w),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Tikus Terdeteksi",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.textgrey),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            StreamBuilder<DatabaseEvent>(
                                stream: reference.onValue,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                  } else if (!snapshot.data!.snapshot.exists) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      width: double.infinity,
                                      child: Text(
                                        '0 Ancaman',
                                        style: TextStyle(
                                          color: AppColors.dark,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }
                                  DataSnapshot data = snapshot.data!.snapshot;
                                  dynamic values = data.value as Map;
                                  return Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    child: Text(
                                      '${values.length} Ancaman',
                                      style: TextStyle(
                                        color: AppColors.dark,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Riwayat Ancaman",
                        style: TextStyle(
                            color: AppColors.dark,
                            fontSize: 22.sp,
                            fontFamily: FontFamily.semibold)),
                  ],
                ),
                SizedBox(height: 20.h),
                FirebaseAnimatedList(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  query: dbRef,
                  itemBuilder: (context, snapshotData, animation, index) {
                    if (!snapshotData.exists) {
                      return const Center(
                        child: Text('Tidak Ada Tikus Terdeteksi'),
                      );
                    }
                    Map data = snapshotData.value as Map;
                    return FutureBuilder(
                        future: urlImages(data['nama_gambar']),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                                child: Text('Tidak Ada Ancaman'));
                          }
                          return Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey))),
                            child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(0.5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: InkWell(
                                    onTap: () {
                                      Map detailImage = {
                                        'url': data['nama_gambar'],
                                        'waktu':
                                            "${data['tanggal']} : ${data['jam']}"
                                      };
                                      Navigator.of(context).push(
                                          PageAnimationTransition(
                                              page: DetailScreen(
                                                  imageUrl: detailImage),
                                              pageAnimationType:
                                                  FadeAnimationTransition()));
                                    },
                                    child: Image.network(
                                      snapshot.data,
                                      width: 60.w,
                                      height: 60.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  data['tanggal'],
                                  style: TextStyle(color: AppColors.dark),
                                ),
                                subtitle: Text(data['jam']),
                                trailing: PopupMenuButton<String>(
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'hapus',
                                        child: Text(
                                          'Hapus',
                                          style:
                                              TextStyle(color: AppColors.dark),
                                        ),
                                      ),
                                    ];
                                  },
                                  onSelected: (String choice) {
                                    if (choice == 'detail') {
                                    } else if (choice == 'hapus') {
                                      String? key = snapshotData.key;
                                      if (key != null) {
                                        reference
                                            .child(key)
                                            .remove()
                                            .then((value) {
                                          storage
                                              .refFromURL(snapshot.data)
                                              .delete()
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Data tikus telah dihapus!'),
                                                duration: Duration(
                                                    seconds:
                                                        2), // Durasi tampilan SnackBar
                                              ),
                                            );
                                          });
                                        });
                                      }
                                    }
                                  },
                                  child: const Icon(Icons.more_vert),
                                )),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> urlImages(linkUrl) async {
    final ref =
        await FirebaseStorage.instance.ref().child('data/image/${linkUrl}');
    final url = await ref.getDownloadURL();
    return url;
  }
}
