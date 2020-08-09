import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreAssigneeSelect extends StatefulWidget {
  final String choreId;
  final List<String> familyMembers;
  final Widget Function(BuildContext, String) itemBuilder;

  ChoreAssigneeSelect({this.choreId, this.familyMembers, this.itemBuilder});

  @override
  _ChoreAssigneeSelectState createState() => _ChoreAssigneeSelectState();
}

class _ChoreAssigneeSelectState extends SelfSubmitState<ChoreAssigneeSelect> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Assign to:', style: Theme.of(context).textTheme.subtitle2),
        ),
        Container(
          height: 90,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.familyMembers.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: selectedIndex == index ? Colors.blue[100] : Colors.transparent,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() {
                      selectedIndex = selectedIndex == index ? -1 : index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: widget.itemBuilder(context, widget.familyMembers[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Future<void> submit() async {
    if (selectedIndex != -1) {
      // TODO not good
      final repository = context.read<ChoreRepository>();
      final chore =
          await repository.getFamilyChores().map((all) => all.firstWhere((c) => c.id == widget.choreId)).first;
      await repository.add(
        Chore(
            id: chore.id,
            dueDate: chore.dueDate,
            description: chore.description,
            assigneeId: widget.familyMembers[selectedIndex]),
      );
    }
  }
}
