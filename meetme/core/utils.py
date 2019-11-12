from django.db import connection


def get_facebook_uid(meet_user_id):
    cursor = connection.cursor()

    cursor.execute("UPDATE bar SET foo = 1 WHERE baz = %s", [])

    cursor.execute("SELECT foo FROM bar WHERE baz = %s", [])

    row = cursor.fetchone()

    return row







