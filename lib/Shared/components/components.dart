// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/modules/web_view.dart';

Widget defaultArticleContainer ( artical,context)
{
  return GestureDetector(
    onTap: () => Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => WebViewScreen(url: artical['url'],))),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration:  BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${artical["urlToImage"]}'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(width: 10,),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      artical['title'],
                      style: TextStyle(
                        color: AppCubit.get(context).isWhiteMode ? Colors.black:Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow:TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    artical["publishedAt"].toString().substring(0,10),
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
  );
}