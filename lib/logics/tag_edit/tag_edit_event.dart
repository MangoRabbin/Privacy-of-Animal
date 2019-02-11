import 'package:meta/meta.dart';
import 'package:privacy_of_animal/bloc_helpers/bloc_event_state.dart';

abstract class TagEditEvent extends BlocEvent{}

class TagEditEventClick extends TagEditEvent {
  final int tagIndex;
  TagEditEventClick({@required this.tagIndex});
}