import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/modals/diary_event.dart';
import 'package:sow_good/views/widgets/sg_diary_component.dart';

import '../../models/default_view_state.dart';
import '../../models/diary_events.dart';
import '../../viewmodels/diary_events_viewmodel.dart';
import '../widgets/sg_loader.dart';

class DiaryEventsPage extends StatefulWidget {
  const DiaryEventsPage({super.key});

  @override
  State<DiaryEventsPage> createState() => _DiaryEventsPageState();
}

class _DiaryEventsPageState extends State<DiaryEventsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DiaryEventsViewmodel viewmodel = DiaryEventsViewmodel();

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void loadData() {
    setState(() {
      switch (viewmodel.state) {
        case DefaultViewState.loading:
          _dialogBuilder(context);
          break;
        case DefaultViewState.requestSucceed:
          Navigator.pop(context);
          break;
        case DefaultViewState.requestFailed:
          Navigator.pop(context);
          break;
        case DefaultViewState.started:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    viewmodel.addListener(() {
      loadData();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewmodel.getDiaryEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: CustomColors.background,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                color: CustomColors.patientPrimary,
                height: 3,
                width: double.infinity,
              )),
          centerTitle: true,
          backgroundColor: CustomColors.patientPrimary,
          title: Text(
            'Diário',
            style: CustomTextStylesBuilder()
                .withColor(CustomColors.background)
                .withSize(26)
                .placeholder(),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
                color: CustomColors.background,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CreateDiaryEvent();
                  },
                );
              },
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print(viewmodel.diaryEvents.length);
              DiaryEvents item = viewmodel.diaryEvents[index];
              return DiaryComponent(
                  title: item.title ?? '',
                  date: item.date ?? '',
                  description: item.description ?? '',
                  link: item.link ?? '');
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                  color: CustomColors.graySubtitle,
                ),
            itemCount: viewmodel.diaryEvents.length),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const sgLoader();
        });
  }
}
