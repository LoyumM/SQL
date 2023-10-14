SELECT DISTINCT host_id, guest_id
FROM airbnb_hosts h JOIN airbnb_guests g
    ON h.nationality = g.nationality
        AND h.gender = g.gender;