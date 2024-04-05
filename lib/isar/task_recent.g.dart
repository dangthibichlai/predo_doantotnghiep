// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_recent.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskRecentCollection on Isar {
  IsarCollection<TaskRecent> get taskRecents => this.collection();
}

const TaskRecentSchema = CollectionSchema(
  name: r'TaskRecent',
  id: -232166153549280735,
  properties: {
    r'avatarProject': PropertySchema(
      id: 0,
      name: r'avatarProject',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'idProject': PropertySchema(
      id: 2,
      name: r'idProject',
      type: IsarType.string,
    ),
    r'idTask': PropertySchema(
      id: 3,
      name: r'idTask',
      type: IsarType.string,
    ),
    r'idUser': PropertySchema(
      id: 4,
      name: r'idUser',
      type: IsarType.string,
    ),
    r'issueType': PropertySchema(
      id: 5,
      name: r'issueType',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameProject': PropertySchema(
      id: 7,
      name: r'nameProject',
      type: IsarType.string,
    )
  },
  estimateSize: _taskRecentEstimateSize,
  serialize: _taskRecentSerialize,
  deserialize: _taskRecentDeserialize,
  deserializeProp: _taskRecentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskRecentGetId,
  getLinks: _taskRecentGetLinks,
  attach: _taskRecentAttach,
  version: '3.1.0',
);

int _taskRecentEstimateSize(
  TaskRecent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarProject;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idProject;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idTask;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idUser;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.issueType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameProject;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskRecentSerialize(
  TaskRecent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarProject);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.idProject);
  writer.writeString(offsets[3], object.idTask);
  writer.writeString(offsets[4], object.idUser);
  writer.writeString(offsets[5], object.issueType);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.nameProject);
}

TaskRecent _taskRecentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskRecent(
    description: reader.readStringOrNull(offsets[1]),
    idProject: reader.readStringOrNull(offsets[2]),
    idTask: reader.readStringOrNull(offsets[3]),
    idUser: reader.readStringOrNull(offsets[4]),
    issueType: reader.readStringOrNull(offsets[5]),
    name: reader.readStringOrNull(offsets[6]),
    nameProject: reader.readStringOrNull(offsets[7]),
  );
  object.avatarProject = reader.readStringOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _taskRecentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskRecentGetId(TaskRecent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskRecentGetLinks(TaskRecent object) {
  return [];
}

void _taskRecentAttach(IsarCollection<dynamic> col, Id id, TaskRecent object) {
  object.id = id;
}

extension TaskRecentQueryWhereSort on QueryBuilder<TaskRecent, TaskRecent, QWhere> {
  QueryBuilder<TaskRecent, TaskRecent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskRecentQueryWhere on QueryBuilder<TaskRecent, TaskRecent, QWhereClause> {
  QueryBuilder<TaskRecent, TaskRecent, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskRecentQueryFilter on QueryBuilder<TaskRecent, TaskRecent, QFilterCondition> {
  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarProject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarProject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarProject',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> avatarProjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarProject',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idProject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idProject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idProject',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idProjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idProject',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idTask',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idTask',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idTask',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idTask',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idTask',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTask',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idTaskIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idTask',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idUser',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idUser',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issueType',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issueType',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issueType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> issueTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issueType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameProject',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameProject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameProject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameProject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameProject',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterFilterCondition> nameProjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameProject',
        value: '',
      ));
    });
  }
}

extension TaskRecentQueryObject on QueryBuilder<TaskRecent, TaskRecent, QFilterCondition> {}

extension TaskRecentQueryLinks on QueryBuilder<TaskRecent, TaskRecent, QFilterCondition> {}

extension TaskRecentQuerySortBy on QueryBuilder<TaskRecent, TaskRecent, QSortBy> {
  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByAvatarProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByAvatarProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarProject', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProject', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIssueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByIssueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByNameProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> sortByNameProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameProject', Sort.desc);
    });
  }
}

extension TaskRecentQuerySortThenBy on QueryBuilder<TaskRecent, TaskRecent, QSortThenBy> {
  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByAvatarProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByAvatarProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarProject', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idProject', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIssueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByIssueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByNameProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameProject', Sort.asc);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QAfterSortBy> thenByNameProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameProject', Sort.desc);
    });
  }
}

extension TaskRecentQueryWhereDistinct on QueryBuilder<TaskRecent, TaskRecent, QDistinct> {
  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByAvatarProject({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarProject', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByIdProject({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idProject', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByIdTask({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idTask', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByIdUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByIssueType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskRecent, TaskRecent, QDistinct> distinctByNameProject({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameProject', caseSensitive: caseSensitive);
    });
  }
}

extension TaskRecentQueryProperty on QueryBuilder<TaskRecent, TaskRecent, QQueryProperty> {
  QueryBuilder<TaskRecent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> avatarProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarProject');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> idProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idProject');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> idTaskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idTask');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUser');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> issueTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueType');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TaskRecent, String?, QQueryOperations> nameProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameProject');
    });
  }
}
