import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/core/error/failure_mapper.dart';
import '../../../../src/di/injection_container.dart';
import '../cubit/sample_feature_cubit.dart';
import '../cubit/sample_feature_state.dart';

class SampleFeaturePage extends StatelessWidget {
  const SampleFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SampleFeatureCubit>(
      create: (_) => sl<SampleFeatureCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sample Feature')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<SampleFeatureCubit, SampleFeatureState>(
              builder: (context, state) {
                if (state is SampleFeatureLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is SampleFeatureLoaded) {
                  return Text(
                    state.entity.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }

                if (state is SampleFeatureError) {
                  return Text(
                    mapFailureToMessage(state.failure),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
