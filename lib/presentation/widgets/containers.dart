import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapeteka/constants/url.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.imageUrl,
    this.title,
    this.amount,
    this.plusButton,
    this.minusButton,
    this.addButton,
    this.onTap,
  }) : super(key: key);

  final String? imageUrl;
  final String? title;
  final int? amount;
  final VoidCallback? plusButton;
  final VoidCallback? minusButton;
  final VoidCallback? addButton;
  final VoidCallback? onTap;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
      child: GestureDetector(
        onTap: widget.onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 1.w,
              color: const Color(0xFF505050),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 4.w),
              SizedBox(
                width: 84.w,
                height: 84.w,
                child: Image.network(
                  baseUrl + '/storage/' + (widget.imageUrl ?? ''),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes!)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, exception, stackTrace) {
                    return Icon(
                      Icons.image_outlined,
                      size: 30.w,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.w),
                    child: SizedBox(
                      width: 180.w,
                      child: Text(
                        widget.title ?? '',
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 99.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: widget.plusButton,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20.w,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.amount.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.plusButton,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 20.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 35.w, 12.w, 15.w),
                child: GreenButton(
                  label: 'Добавить',
                  onPressed: widget.addButton,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
