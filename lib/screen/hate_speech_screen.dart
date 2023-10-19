import 'package:classifier/provider/hate_speech_provider.dart';
import 'package:classifier/provider/image_classification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HateSpeechScreen extends ConsumerWidget {
  const HateSpeechScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);
    final textC = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: textC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              minLines: 10,
              maxLines: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              ref.read(isLoadingProvider.notifier).state = true;
              final result =
                  await HateSpeechUtil().hateSpeechDetection(textC.text);
              ref.read(isLoadingProvider.notifier).state = false;
              ref.read(imageResultProvider.notifier).state = result;
            },
            child: const Text("Detect Text"),
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
              child: ref.watch(hateSpeechResultProvider) != null
                  ? Center(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.blue,
                            ))
                          : Text(
                              ref.watch(hateSpeechResultProvider)!,
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
