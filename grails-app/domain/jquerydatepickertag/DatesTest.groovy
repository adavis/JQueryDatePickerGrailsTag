package jquerydatepickertag

import org.apache.commons.lang.builder.ToStringBuilder

class DatesTest {

    Date dob
    Date dateRegistered
    Date dateEnrolled

    static constraints = {

        dob(nullable: false, blank: false)
        dateRegistered(nullable: false, blank: false)
        dateEnrolled(nullable: false, blank: false)
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).
                append("dob", dob).
                append("dateRegistered", dateRegistered).
                append("dateEnrolled", dateEnrolled).
                toString();
    }
}
