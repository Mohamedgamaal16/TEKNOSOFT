import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddAndRemoveItem extends StatefulWidget {
  const AddAndRemoveItem({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  // ignore: library_private_types_in_public_api
  _AddAndRemoveItemState createState() => _AddAndRemoveItemState();
}

class _AddAndRemoveItemState extends State<AddAndRemoveItem> {
  double itemCount = 1,result = 1;

  void increaseItemCount() {
    setState(() {
      itemCount++;
     result = widget.price * itemCount;
    });
  }

  void decreaseItemCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
       result = widget.price / itemCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decreaseItemCount,
        ),
        Text(
          itemCount.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increaseItemCount,
        ),
        const SizedBox(
          width: 20,
        ),
        result == 1
    ? Text(
        '${widget.price} EGP',
        style: AppStyles.interStyleRegular12(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    : Text(
        // ignore: unnecessary_brace_in_string_interps
        '${result} EGP',
        style: AppStyles.interStyleRegular12(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )

      ],
    );
  }
}
