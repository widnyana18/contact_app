import 'package:contact_app/home.dart';
import 'package:go_router/go_router.dart';

import '../view/views.dart';

const teleponRoute = 'telepon';
const contactRoute = 'contact';

final appRouter = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   redirect: (context, state) => '/',
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomePage();
      },
      routes: [
        GoRoute(
          path: teleponRoute,
          name: teleponRoute,
          builder: (context, state) => TeleponView(),
          routes: [
            GoRoute(
              path: ':userId',
              name: 'telepon_details',
              builder: (context, state) {
                final id = state.params['userId']!;
                return ContactDetailsView(
                  userId: id,
                  showCallLogWidget: true,
                );
              },
              routes: [
                GoRoute(
                  path: 'logs',
                  name: 'call_logs',
                  builder: (context, state) => CallLogDetailsView(),
                ),
              ],
            ),
            GoRoute(
              path: 'dial',
              name: 'dial_pad',
              builder: (context, state) => DialPadView(),
            ),
          ],
        ),
        GoRoute(
          path: contactRoute,
          name: contactRoute,
          builder: (context, state) => ContactView(),
          routes: [
            GoRoute(
              path: 'create',
              name: 'add_contact',
              builder: (context, state) => AddEditContactView(),
            ),
            GoRoute(
              path: ':userId',
              name: 'contact-details',
              builder: (context, state) {
                final id = state.params['userId']!;
                return ContactDetailsView(userId: id);
              },
              routes: [
                GoRoute(
                  path: 'edit',
                  name: 'edit_contact',
                  builder: (context, state) =>
                      AddEditContactView(editMode: true),
                ),
              ],
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/call-in',
      name: 'call_in',
      builder: (context, state) => CallVIew(
        key: state.pageKey,
      ),
    )
  ],
);
