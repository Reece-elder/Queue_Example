import React from "react";
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";
import axios from "axios";
const Ticket = ({ id, title, description, timestamp, status, author }) => {
  const deleteTicket = (e) => {
    console.log("delete data");
    axios
      .delete("http://localhost:8080/deleteTicket/" + id, {
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
      .then(
        (response) => {
          console.log(response);
        },
        (error) => {
          console.log(error);
        }
      );
  };

  return (
    <Card>
      <Card.Header>{title} </Card.Header>
      <Card.Body>
        <Card.Text> {status}</Card.Text>
        <Card.Text> ID: {id} </Card.Text>
        <Card.Text> {description}</Card.Text>
        <Card.Text> {author}</Card.Text>
      </Card.Body>
      <Card.Footer>
        <Button variant="primary" className="m-2">
          Update
        </Button>
        <Button
          variant="danger"
          className="m-2"
          onClick={(e) => deleteTicket(e)}
        >
          Delete
        </Button>
        <small className="text-muted m-2">{timestamp}</small>
      </Card.Footer>
    </Card>
  );
};
export default Ticket;
