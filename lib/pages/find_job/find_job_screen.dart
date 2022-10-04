import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';

import 'find_job_viewmodel.dart';

class FindJobScreen extends StatelessWidget {
  const FindJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<FindJobViewModel>(
        viewmodel: FindJobViewModel(), child: Container());
  }
}
