import axios from "axios";
import React, { useState } from "react";
import Button from "react-bootstrap/esm/Button";
import Form from "react-bootstrap/Form";
const TicketForm = () => {
  const [author, setAuthor] = useState(``);
  const [title, setTitle] = useState(``);
  const [description, setDescription] = useState(``);
  const [status, setStatus] = useState(`Unresolved`);
  const [timestamp, setTimestamp] = useState(
    new Date().toLocaleString("en-GB")
  );
  const [id, setId] = useState(``);

  const ticketData = {
    title: title,
    author: author,
    description: description,
    status: status,
    timestamp: timestamp,
  };

  const postNewData = (e) => {
    const newDate = new Date().toLocaleString("en-GB");
    setTimestamp(newDate);
    axios
      .post("http://localhost:8080/createTicket", ticketData, {
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
  };

    const updateData = (e) => {
      setTimestamp(new Date().toLocaleString("en-GB"));
      axios
        .put("http://localhost:8080/updateTicket/" + id, ticketData, {
          headers: {
            "Access-Control-Allow-Origin": "*",
          },
        })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(ticketData);
          console.log(error);
        });
    };

  return (
    <div>
      <h2>Create or Update Ticket</h2>
      <Form>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Title</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter Ticket Title"
            onChange={(e) => {
              setTitle(e.target.value);
            }}
          />
        </Form.Group>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Ticket ID</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter existing ticket ID to update ticket, if new ticket leave blank"
            onChange={(e) => {
              setId(e.target.value);
            }}
          />
        </Form.Group>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Author</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter Ticket Author"
            onChange={(e) => {
              setAuthor(e.target.value);
            }}
          />
        </Form.Group>
        <Form.Group controlId="exampleForm.ControlSelect1">
          <Form.Label>Status</Form.Label>
          <Form.Control
            as="select"
            onChange={(e) => {
              setStatus(e.target.value);
            }}
          >
            <option>Unresolved</option>
            <option>In Progress</option>
            <option>Resolved</option>
          </Form.Control>
        </Form.Group>
        <Form.Group controlId="exampleForm.ControlTextarea1">
          <Form.Label>Ticket Description</Form.Label>
          <Form.Control
            as="textarea"
            rows={3}
            onChange={(e) => {
              setDescription(e.target.value);
            }}
          />
        </Form.Group>
        <Button
          onClick={(e) => postNewData(e)}
          variant="primary"
          size="lg"
          className="m-2"
        >
          Create Ticket
        </Button>
        <Button
          onClick={(e) => updateData(e)}
          variant="success"
          size="lg"
          className="m-2"
        >
          Update Ticket
        </Button>
      </Form>
    </div>
  );
};
export default TicketForm;
