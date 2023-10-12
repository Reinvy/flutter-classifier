import 'dart:io';

import 'package:classifier/provider/provider.dart';
import 'package:classifier/utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              color: Colors.grey[400],
              image: ref.watch(imageProvider) != null
                  ? DecorationImage(
                      image: FileImage(
                        File(ref.watch(imageProvider)!.path),
                      ),
                      fit: BoxFit.cover)
                  : const DecorationImage(
                      image: AssetImage("assets/man_woman.png"),
                    ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              final image = await ImageUtil().pickImage();
              ref.read(imageProvider.notifier).state = image;
            },
            child: const Text("Select Image"),
          ),
          ElevatedButton(
            onPressed: ref.read(imageProvider) == null
                ? null
                : () async {
                    ref.read(isLoadingProvider.notifier).state = true;
                    final result = await ImageUtil()
                        .imageClassification(ref.read(imageProvider)!);
                    ref.read(isLoadingProvider.notifier).state = false;
                    ref.read(imageResultProvider.notifier).state = result;
                  },
            child: const Text("Classification"),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ref.watch(imageResultProvider) != null
                  ? Center(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.blue,
                            ))
                          : Text(
                              ref.watch(imageResultProvider)!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                    )
                  : isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.blue,
                        ))
                      : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
