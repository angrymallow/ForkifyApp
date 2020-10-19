import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ConnectionFailure extends Failure {
  @override
  List<Object> get props => [];

}