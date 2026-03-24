import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lyric_flow/core/di/injection.dart' as di;
import 'package:lyric_flow/core/navigation/app_router.dart';
import 'package:lyric_flow/core/theme/app_colors.dart';
import 'package:lyric_flow/features/lyrics/domain/entities/lyrics_entity.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/saved_generations_repository.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_bloc.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_event.dart';

class SavedGenerationsScreen extends StatelessWidget {
  const SavedGenerationsScreen({super.key});

  static LyricsEntity _entityFromDoc(Map<String, dynamic> data) {
    return LyricsEntity(
      verse1: data['verse1'] as String? ?? '',
      chorus: data['chorus'] as String? ?? '',
      verse2: data['verse2'] as String? ?? '',
      score: (data['score'] as num?)?.toDouble() ?? 0,
    );
  }

  static String _formatCreatedAt(dynamic value) {
    if (value is Timestamp) {
      return DateFormat.yMMMd().add_jm().format(value.toDate());
    }
    return '';
  }

  static String _firstLyricLine(Map<String, dynamic> doc) {
    for (final key in ['verse1', 'chorus', 'verse2']) {
      final block = doc[key] as String? ?? '';
      for (final line in block.split('\n')) {
        final t = line.trim();
        if (t.isNotEmpty) return t;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.backgroundLight;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'My generations',
          style: GoogleFonts.newsreader(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: user == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to see lyrics saved from this device.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 16,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () => context.go(AppRoutes.login),
                      child: const Text('Go to sign in'),
                    ),
                  ],
                ),
              ),
            )
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: di.sl<SavedGenerationsRepository>().getGenerations(
                user.uid,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Could not load library.\n${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }
                final items = snapshot.data!;
                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      'No saved lyrics yet.\nGenerate from the home screen — '
                      'they appear here automatically.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final doc = items[index];
                    final mood = doc['mood'] as String? ?? '—';
                    final language = doc['language'] as String? ?? '—';
                    final enhancement =
                        doc['enhancementType'] as String? ?? '';
                    final created = _formatCreatedAt(doc['createdAt']);
                    final preview = _firstLyricLine(doc);
                    final subtitle = [
                      if (created.isNotEmpty) created,
                      '$mood · $language',
                      if (enhancement.isNotEmpty) 'Enhanced: $enhancement',
                    ].join('\n');

                    return Material(
                      color: isDark
                          ? AppColors.surfaceDark
                          : AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          final entity = _entityFromDoc(doc);
                          context.read<LyricsBloc>().add(
                                LyricsEvent.openFromLibrary(
                                  lyrics: entity,
                                  mood: mood == '—' ? 'Unknown' : mood,
                                  language:
                                      language == '—' ? 'Unknown' : language,
                                ),
                              );
                          context.push(AppRoutes.generatedLyrics);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                preview.isEmpty ? '(No preview)' : preview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.beVietnamPro(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                subtitle,
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.white54
                                      : Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
