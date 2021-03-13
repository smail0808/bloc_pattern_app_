import 'package:bloc_pattern/logic/cubit/counter_cubit.dart';
import 'package:bloc_pattern/presentation/screens/second_screen.dart';
import 'package:bloc_pattern/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CounterBloc bloc;

  @override
  void initState() {
    // bloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('you have pushed the button this many times'),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Increment'),
                    duration: Duration(milliseconds: 100),
                  ));
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Decrement'),
                    duration: Duration(milliseconds: 100),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterVlaue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            color: Colors.green,
            child: Text('Go to second Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          MaterialButton(
              color: Colors.red,
              child: Text('Go to third Screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              }),
        ],
      ),
    );
  }
}
